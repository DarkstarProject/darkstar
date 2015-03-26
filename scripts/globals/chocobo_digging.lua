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

    local SkillRank = player:getSkillRank(SKILL_RID);
    
    -- base delay -5 for each rank 
    local DigDelay = 16 - (SkillRank * 5);
    local AreaDigDelay = 60 - (SkillRank * 5);

    -- neither player nor zone have reached their dig limit
    -- TODO: Add in a setting in map_server.config to disable the fatigue limit, if the server admin wants to.
    
    if (DigCount < 100 and ZoneItemsDug < 20) then
        -- pesky delays
        if ((ZoneInTime <= AreaDigDelay + CurrentTime) and (LastDigTime + DigDelay <= CurrentTime)) then
            return true;
        end
    end
    
    return false;
end;


local function calculateSkillUp(player)
    
    -- SKILL_RID cause we're gonna use SKILL_DIG for burrow/bore
    local SkillRank = player:getSkillRank(SKILL_RID);
    local MaxSkill = (SkillRank + 1) * 100;
    local RealSkill = player:getSkillLevel(SKILL_RID);
    
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
            player:setSkillLevel(SKILL_RID, RealSkill + SkillIncrement);
            
            -- gotta update the skill rank and push packet
            for i = 0, 10, 1 do
                if (SkillRank == i and RealSkill >= ((SkillRank * 100) + 100)) then
                    player:setSkillRank(SKILL_RID, SkillRank + 1);
                end
            end
            
            if ((RealSkill / 10) < ((RealSkill + SkillIncrement) / 10)) then
               -- todo: get this working correctly (apparently the lua binding updates RealSkills and WorkingSkills)
               player:setSkillLevel(SKILL_RID, SkillRank + 0x20); 
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


function chocoboDig(player, itemMap, precheck, messageArray, zoneWeather)
    
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
            
            -- item and DIG_ABUNDANCE_BONUS 3 digits, dont wanna get left out
            Chance = Chance * 100;
            
            -- We need to check for moon phase, too. 45-60% results in a much lower dig chance than the rest of the phases

            if (Chance < (RItemAbundance + DIG_ABUNDANCE_BONUS)) then
            
                local RItemID = RandomItem[1];
                local RItemReq = RandomItem[3];
                
                -- rank 1 is burrow, rank 2 is bore (see DIGABILITY at the top of the file)
                local DigAbility = player:getSkillRank(SKILL_DIG);
                
                local Mod = player:getMod(MOD_EGGHELM);
                
                if (RItemReq == DIGREQ_NONE) then
                    ItemID = RItemID;
                elseif (RItemReq == DIGREQ_BURROW and DigAbility == DIGABILITY_BURROW) then
                    ItemID = RItemID;
                elseif (RItemReq == DIGREQ_BORE and DigAbility == DIGABILITY_BORE) then
                    ItemID = RItemID;
                elseif (RItemReq == DIGREQ_MODIFIER and Mod) then
                    ItemID = RItemID;
                elseif (RItemReq == DIGREQ_NIGHT and VanadielTOTD() == TIME_NIGHT) then
                    ItemID = RItemID;
                end
                
                -- Let's see if the item should be obtained in this zone with this weather

                if ((weather == 4 or weather == 5) and ItemID == 4096) then
                  ItemID = ItemID;
                elseif ((weather == 6 or weather == 7) and ItemID == 4097) then
                  ItemID = ItemID;
                elseif ((weather == 8 or weather == 9) and ItemID == 4098) then
                  ItemID = ItemID;
                elseif ((weather == 10 or weather == 11) and ItemID == 4099) then
                  ItemID = ItemID;
                elseif ((weather == 12 or weather == 13) and ItemID == 4100) then
                  ItemID = ItemID;
                elseif ((weather == 14 or weather == 15) and ItemID == 4101) then
                  ItemID = ItemID;
                elseif ((weather == 16 or weather == 17) and ItemID == 4102) then
                  ItemID = ItemID;
                elseif ((weather == 18 or weather == 19) and ItemID == 4103) then
                  ItemID = ItemID;
                else
                  ItemID = 0;
                endif
                
                -- If the item is a crystal, we need to check for a double weather effect (Which results in a crystal cluster, not a single crystal)
                if (ItemID >= 4096 or ItemID <= 4103) then
                  if (zoneWeather == "WEATHER_DOUBLE") then
                    ItemID = ItemID + 8;
                  elseif (zoneWeather == "WEATHER_SINGLE") then
                    ItemID = ItemID;
                  else
                    ItemID = 0;
                  end
                end
                
            end
            
            -- make sure we have a valid item
            if (ItemID ~= 0) then
                -- make sure we have enough room for the item
                if (player:getFreeSlotsCount() > 0) then
                    -- add the item
                    player:addItem(ItemID);
                    player:messageSpecial(messageArray[3], ItemID);
                    
                    updateZoneDigCount(player:getZoneID(), 1);
                else
                    -- inventory is full, throw item away
                    player:messageSpecial(messageArray[1], ItemID);
                end
            else
                -- beat the dig chance, but not the item chance
                player:messageText(player, messageArray[2], false);
            end
            
            
        end
        calculateSkillUp(player);
        -- If fatigue is set, increment the dig counter for the player, if not, don't set it
        updatePlayerDigCount(player, 1);
    end
    return true;
end;