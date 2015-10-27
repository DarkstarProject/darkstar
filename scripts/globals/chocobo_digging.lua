-- chocobo_digging.lua

require("scripts/globals/status");
require("scripts/globals/utils");
require("scripts/globals/settings");

-----------------------------------
-- DIG REQUIREMENTS
-----------------------------------
DIGREQ_NONE     = 0;
DIGREQ_BURROW   = 1;
DIGREQ_BORE     = 2;
DIGREQ_MODIFIER = 4;
DIGREQ_NIGHT    = 8;

local DIGABILITY_BURROW = 1;
local DIGABILITY_BORE   = 2;

local function canDig(player)

    local DigCount = player:getVar('[DIG]DigCount');
    local LastDigTime = player:getLocalVar('[DIG]LastDigTime');
    local ZoneItemsDug = GetServerVariable('[DIG]ZONE'..player:getZoneID()..'_ITEMS');
    local ZoneInTime = player:getLocalVar('[DIG]ZoneInTime');
    local CurrentTime = os.time(os.date('!*t'));

    local SkillRank = player:getSkillRank(SKILL_DIG);

    -- base delay -5 for each rank
    local DigDelay = 16 - (SkillRank * 5);
    local AreaDigDelay = 60 - (SkillRank * 5);

    -- neither player nor zone have reached their dig limit

    if ((DigCount < 100 and ZoneItemsDug < 20) or DIG_FATIGUE == 0 ) then
        -- pesky delays
        if ((ZoneInTime <= AreaDigDelay + CurrentTime) and (LastDigTime + DigDelay <= CurrentTime)) then
            return true;
        end
    end

    return false;
end;


local function calculateSkillUp(player)

    -- 59 cause we're gonna use SKILL_DIG for burrow/bore
    local SkillRank = player:getSkillRank(SKILL_DIG);
    local MaxSkill = (SkillRank + 1) * 100;
    local RealSkill = player:getSkillLevel(SKILL_DIG);

    local SkillIncrement = 1;

    -- this probably needs correcting
    local SkillUpChance = math.random(0, 100);

    -- make sure our skill isn't capped
    if (RealSkill < MaxSkill) then
        -- can we skill up?
        if (SkillUpChance <= 15) then
            if ((SkillIncrement + RealSkill) > MaxSkill) then
                SkillIncrement = MaxSkill - RealSkill;
            end

            -- skill up!
            player:setSkillLevel(SKILL_DIG, RealSkill + SkillIncrement);

            -- gotta update the skill rank and push packet
            for i = 0, 10, 1 do
                if (SkillRank == i and RealSkill >= ((SkillRank * 100) + 100)) then
                    player:setSkillRank(SKILL_DIG, SkillRank + 1);
                end
            end

            if ((RealSkill / 10) < ((RealSkill + SkillIncrement) / 10)) then
               -- todo: get this working correctly (apparently the lua binding updates RealSkills and WorkingSkills)
               player:setSkillLevel(SKILL_DIG, player:getSkillLevel(SKILL_DIG) + 0x20);
            end
        end
    end

end;


function updatePlayerDigCount(player, increment)

    local CurrentTime = os.time(os.date('!*t'));

    if (increment == 0) then
        player:setVar('[DIG]DigCount', 0);
    else
        local DigCount = player:getVar('[DIG]DigCount');
        player:setVar('[DIG]DigCount', DigCount + increment);
    end

        player:setLocalVar('[DIG]LastDigTime', CurrentTime);
end;


function updateZoneDigCount(zone, increment)

    local ZoneDigCount = GetServerVariable('[DIG]ZONE'..zone..'_ITEMS');

    -- 0 means we wanna wipe (probably only gonna happen onGameDay or something)
    if (increment == 0) then
        SetServerVariable('[DIG]ZONE'..zone..'ITEMS', 0);
    else
        SetServerVariable('[DIG]ZONE'..zone..'ITEMS', ZoneDigCount + increment);
    end
end;


function chocoboDig(player, itemMap, precheck, messageArray)

    -- make sure the player can dig before going any further
    -- (and also cause i need a return before core can go any further with this)
    if (precheck) then
        return canDig(player);
    else

        local DigCount = player:getVar('[DIG]DigCount');
        local Chance = math.random(0, 100);

        if (Chance <= 15) then
            player:messageText(player, messageArray[2]);
            calculateSkillUp(player);
        else
            -- recalculate chance to compare with item abundance
            Chance = math.random(0, 100);

            -- select a random item
            local RandomItem = itemMap[math.random(1, #itemMap)];
            local RItemAbundance = RandomItem[2];

            local ItemID = 0;
            local weather = player:getWeather();
            local moon = VanadielMoonPhase();
            local day = VanadielDayElement();
           
            -- item and DIG_ABUNDANCE_BONUS 3 digits, dont wanna get left out
            Chance = Chance * 100;

            -- We need to check for moon phase, too. 45-60% results in a much lower dig chance than the rest of the phases

            if (moon >= 45 and moon <=60) then
              Chance = Chance * .5;
            end

            if (Chance < (RItemAbundance + DIG_ABUNDANCE_BONUS)) then

                local RItemID = RandomItem[1];
                local RItemReq = RandomItem[3];

                -- rank 1 is burrow, rank 2 is bore (see DIGABILITY at the top of the file)
                local DigAbility = player:getSkillRank(SKILL_DIG);

                local Mod = player:getMod(MOD_EGGHELM);

                if ((RItemReq == DIGREQ_NONE) or (RItemReq == DIGREQ_BURROW and DigAbility == DIGABILITY_BURROW) or (RItemReq == DIGREQ_BORE and DigAbility == DIGABILITY_BORE) or (RItemReq == DIGREQ_MODIFIER and Mod == 1) or (RItemReq == DIGREQ_NIGHT and VanadielTOTD() == TIME_NIGHT)) then
                    ItemID = RItemID;
                else
                    ItemID = 0;
                end

                -- Let's see if the item should be obtained in this zone with this weather
    local crystalMap = {
            0, -- fire crystal
            8, -- fire cluster
            5, -- water crystal
            13, -- water cluster
            3, -- earth crystal
            11, -- earth cluster
            2, -- wind crystal
            10, -- wind cluster
            1, -- ice crystal
            9, -- ice cluster
            4, -- lightning crystal
            12, -- lightning cluster
            6, -- light crystal
            14, -- light cluster
            7, -- dark crystal
            15, -- dark cluster
    };
                if (weather >= 4 and ItemID == 4096) then
                  ItemID = ItemID + crystalMap[weather-3];
                end
    local oreMap = {
            0, -- fire ore
            3, -- earth ore
            5, -- water ore
            2, -- wind ore
            1, -- ice ore
            4, -- lightning ore
            6, -- light ore
            7, -- dark ore
    };
                -- If the item is an elemental ore, we need to check if the requirements are met
                if (ItemID == 1255 and weather > 1 and (moon >= 10 and moon <= 40) and SkillRank >= 7) then
                ItemID = ItemID + oreMap[day+1];
                end

            -- make sure we have a valid item
            if (ItemID ~= 0) then
                -- make sure we have enough room for the item
                if (player:addItem(ItemID)) then
                player:messageSpecial(ITEM_OBTAINED, ItemID);
                else
                player:messageSpecial(DIG_THROW_AWAY, ItemID);
                end
            else
                -- beat the dig chance, but not the item chance
                player:messageText(player, messageArray[2], false);
            end

        end
        calculateSkillUp(player);
        updatePlayerDigCount(player, 1);
    end
    return true;
    end
end;