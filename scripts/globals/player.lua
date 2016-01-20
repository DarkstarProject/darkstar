-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/status");
require("scripts/globals/titles");
require("scripts/globals/gear_sets");

-----------------------------------
-- onGameIn
-----------------------------------

function onGameIn(player, firstlogin, zoning)
    if (not zoning) then -- Things checked ONLY during logon go here.
        if (firstlogin) then
            CharCreate(player);
        end
    end

    if (zoning) then -- Things checked ONLY during zone in go here.
        -- Nothing here yet :P
    end

    -- Things checked BOTH during logon AND zone in below this line.
    checkForGearSet(player);

    if (player:getVar("GodMode") == 1) then
        -- Add bonus effects to the player..
        player:addStatusEffect(EFFECT_MAX_HP_BOOST,1000,0,0);
        player:addStatusEffect(EFFECT_MAX_MP_BOOST,1000,0,0);
        player:addStatusEffect(EFFECT_SENTINEL,100,0,0);
        player:addStatusEffect(EFFECT_MIGHTY_STRIKES,1,0,0);
        player:addStatusEffect(EFFECT_HUNDRED_FISTS,1,0,0);
        player:addStatusEffect(EFFECT_CHAINSPELL,1,0,0);
        player:addStatusEffect(EFFECT_PERFECT_DODGE,1,0,0);
        player:addStatusEffect(EFFECT_INVINCIBLE,1,0,0);
        player:addStatusEffect(EFFECT_MANAFONT,1,0,0);
        player:addStatusEffect(EFFECT_REGAIN,150,1,0);
        player:addStatusEffect(EFFECT_REFRESH,99,0,0);
        player:addStatusEffect(EFFECT_REGEN,99,0,0);

        -- Add bonus mods to the player..
        player:addMod(MOD_RACC,2500);
        player:addMod(MOD_RATT,2500);
        player:addMod(MOD_ACC,2500);
        player:addMod(MOD_ATT,2500);
        player:addMod(MOD_MATT,2500);
        player:addMod(MOD_MACC,2500);
        player:addMod(MOD_RDEF,2500);
        player:addMod(MOD_DEF,2500);
        player:addMod(MOD_MDEF,2500);

        -- Heal the player from the new buffs..
        player:addHP( 50000 );
        player:setMP( 50000 );
    end

    if (player:getVar("GMHidden") == 1) then
        player:setGMHidden(true);
    end

end;

-----------------------------------
-- CharCreate
-----------------------------------

function CharCreate(player)
    local race = player:getRace();
    local body = nil;
    local leg = nil;
    local hand = nil;
    local feet = nil;

    -- ADD RACE SPECIFIC STARTGEAR
    switch(race) : caseof
    {
        -- HUME MALE
        [1] = function (x)
            body = 0x3157;
            hand = 0x31D2;
            leg = 0x3253;
            feet = 0x32CD;
        end,

        -- HUME FEMALE
        [2] = function (x)
            body = 0x3158;
            hand = 0x31D8;
            leg = 0x3254;
            feet = 0x32D2;
        end,

        -- ELVAAN MALE
        [3] = function (x)
            body = 0x3159;
            hand = 0x31D3;
            leg = 0x3255;
            feet = 0x32CE;
        end,

        -- ELVAAN FEMALE
        [4] = function (x)
            body = 0x315A;
            hand = 0x31D7;
            leg = 0x3259;
            feet = 0x32D3;
        end,

        -- TARU MALE
        [5] = function (x)
            body = 0x315B;
            hand = 0x31D4;
            leg = 0x3256;
            feet = 0x32CF;
        end,

        -- TARU FEMALE
        [6] = function (x)
            body = 0x315B;
            hand = 0x31D4;
            leg = 0x3256;
            feet = 0x32CF;
        end,

        -- MITHRA
        [7] = function (x)
            body = 0x315C;
            hand = 0x31D5;
            leg = 0x3257;
            feet = 0x32D0;
        end,

        -- GALKA
        [8] = function (x)
            body = 0x315D;
            hand = 0x31D6;
            leg = 0x3258;
            feet = 0x32D1;
        end,

        default = function (x) end,
    }

    -- Add starting gear
    if not(player:hasItem(body)) then
        player:addItem(body);
        player:equipItem(body);
    end

    if not(player:hasItem(hand)) then
        player:addItem(hand);
        player:equipItem(hand);
    end

    if not(player:hasItem(leg)) then
        player:addItem(leg);
        player:equipItem(leg);
    end

    if not(player:hasItem(feet)) then
        player:addItem(feet);
        player:equipItem(feet);
    end

    -- ADD JOB SPECIFIC STARTGEAR
    switch(player:getMainJob()) : caseof
    {
        -- WARRIOR JOB
        [0x01]= function (x)
            if not(player:hasItem(0x4096)) then
                player:addItem(0x4096);
            end
        end,

        -- MONK JOB
        [0x02]= function (x)
            if not(player:hasItem(0x3380)) then
                player:addItem(0x3380);
            end
        end,

        -- WHITE MAGE
        [0x03]= function(x)
            if not(player:hasItem(0x42AC)) then
                player:addItem(0x42AC);
            end

            if not(player:hasItem(0x1200)) then
            player:addItem(0x1200);
            end
        end,

        -- BLACK MAGE
        [0x04] = function(x)

            if not(player:hasItem(0x42D0)) then
                player:addItem(0x42D0);
            end

            if not(player:hasItem(0x11FF)) then
                player:addItem(0x11FF);
            end
        end,

        -- RED MAGE
        [0x05]= function (x)
            if not(player:hasItem(0x4062)) then
                player:addItem(0x4062);
            end
            if not(player:hasItem(0x11FE)) then
                player:addItem(0x11FE);
            end
        end,

        -- THIEF
        [0x06]= function (x)
            if not(player:hasItem(0x4063)) then
                player:addItem(0x4063);
            end
        end,

        default = function (x) end,
    }

    -- ADD NATION SPECIFIC STARTGEAR
    switch (player:getNation()) : caseof
    {
        -- SANDY CITIZEN
        [0] = function (x)
            if ((race == 3) or (race == 4))
                then player:addItem(0x34B7);
            end;
            player:addKeyItem(MAP_OF_THE_SAN_DORIA_AREA);
        end,

        -- BASTOK CITIZEN
        [1] = function (x)
            if (((race == 1) or (race == 2) or (race == 8)))
                then player:addItem(0x34B9);
            end;
            player:addKeyItem(MAP_OF_THE_BASTOK_AREA);
        end,

        -- WINDY CITIZEN
        [2] = function(x)
            if (((race == 5) or (race == 6) or (race == 7)))
                then player:addItem(0x34B8);
            end;
            player:addKeyItem(MAP_OF_THE_WINDURST_AREA);
        end,

        default = function (x) end,
    }

   ----- settings.lua Perks -----
    if (ADVANCED_JOB_LEVEL == 0) then
       for i = 6,22 do
          player:unlockJob(i);
       end
    end

    if (SUBJOB_QUEST_LEVEL == 0) then
       player:unlockJob(0);
    end

    if (ALL_MAPS == 1) then
       for i=385,447 do
          player:addKeyItem(i);
       end
       for i=1856,1917 do
          player:addKeyItem(i);
       end
       for i=2302,2305 do
          player:addKeyItem(i);
       end
       for i=2307,2309 do
          player:addKeyItem(i);
       end
    end

    if (INITIAL_LEVEL_CAP ~= 50) then
       player:levelCap(INITIAL_LEVEL_CAP)
    end

    if (START_INVENTORY > 30) then
       player:changeContainerSize(0,(START_INVENTORY - 30))
       player:changeContainerSize(5,(START_INVENTORY - 30))
    end

    if (UNLOCK_OUTPOST_WARPS >= 1) then
       player:addNationTeleport(0,2097120);
       player:addNationTeleport(1,2097120);
       player:addNationTeleport(2,2097120);
       if (UNLOCK_OUTPOST_WARPS == 2) then -- Tu'Lia and Tavnazia
          player:addNationTeleport(0,10485760);
          player:addNationTeleport(1,10485760);
          player:addNationTeleport(2,10485760);
       end
    end
    ----- End settings.lua Perks -----

    -- SET START GIL
    --[[For some intermittent reason m_ZoneList ends up empty on characters, which is
    possibly also why they lose key items.  When that happens, CharCreate will be run and
    they end up losing their gil to the code below.  Added a conditional to hopefully
    prevent that until the bug is fixed.  Used the if instead of addGil to prevent abuse
    on servers with very high values of START_GIL, I guess.]]
    if (player:getGil() < START_GIL) then
       player:setGil(START_GIL);
    end

    -- ADD ADVENTURER COUPON
    player:addItem(0x218);

    --SET TITLE
    player:addTitle(NEW_ADVENTURER);

    -- Needs Moghouse Intro
    player:setVar("MoghouseExplication",1);
    
end;

function onPlayerLevelUp(player)
end

function onPlayerLevelDown(player)
end
