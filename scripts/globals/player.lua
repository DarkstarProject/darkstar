-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/gear_sets");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/status");
require("scripts/globals/titles");
require("scripts/globals/shop");
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
        player:addStatusEffect(dsp.effect.MAX_HP_BOOST,1000,0,0);
        player:addStatusEffect(dsp.effect.MAX_MP_BOOST,1000,0,0);
        player:addStatusEffect(dsp.effect.MIGHTY_STRIKES,1,0,0);
        player:addStatusEffect(dsp.effect.HUNDRED_FISTS,1,0,0);
        player:addStatusEffect(dsp.effect.CHAINSPELL,1,0,0);
        player:addStatusEffect(dsp.effect.PERFECT_DODGE,1,0,0);
        player:addStatusEffect(dsp.effect.INVINCIBLE,1,0,0);
        player:addStatusEffect(dsp.effect.ELEMENTAL_SFORZO,1,0,0);
        player:addStatusEffect(dsp.effect.MANAFONT,1,0,0);
        player:addStatusEffect(dsp.effect.REGAIN,300,0,0);
        player:addStatusEffect(dsp.effect.REFRESH,99,0,0);
        player:addStatusEffect(dsp.effect.REGEN,99,0,0);

        -- Add bonus mods to the player..
        player:addMod(dsp.mod.RACC,2500);
        player:addMod(dsp.mod.RATT,2500);
        player:addMod(dsp.mod.ACC,2500);
        player:addMod(dsp.mod.ATT,2500);
        player:addMod(dsp.mod.MATT,2500);
        player:addMod(dsp.mod.MACC,2500);
        player:addMod(dsp.mod.RDEF,2500);
        player:addMod(dsp.mod.DEF,2500);
        player:addMod(dsp.mod.MDEF,2500);

        -- Heal the player from the new buffs..
        player:addHP(50000);
        player:setMP(50000);
    end

    if (player:getVar("GMHidden") == 1) then
        player:setGMHidden(true);
    end

    -- Remember time player zoned in (e.g., to support zone-in delays)
    player:setLocalVar("ZoneInTime", os.time());
end;

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
            body = 12631;
            hand = 12754;
            leg = 12883;
            feet = 13005;
        end,

        -- HUME FEMALE
        [2] = function (x)
            body = 12632;
            hand = 12760;
            leg = 12884;
            feet = 13010;
        end,

        -- ELVAAN MALE
        [3] = function (x)
            body = 12633;
            hand = 12755;
            leg = 12885;
            feet = 13006;
        end,

        -- ELVAAN FEMALE
        [4] = function (x)
            body = 12634;
            hand = 12759;
            leg = 12889;
            feet = 13011;
        end,

        -- TARU MALE
        [5] = function (x)
            body = 12635;
            hand = 12756;
            leg = 12886;
            feet = 13007;
        end,

        -- TARU FEMALE
        [6] = function (x)
            body = 12635;
            hand = 12756;
            leg = 12886;
            feet = 13007;
        end,

        -- MITHRA
        [7] = function (x)
            body = 12636;
            hand = 12757;
            leg = 12887;
            feet = 13008;
        end,

        -- GALKA
        [8] = function (x)
            body = 12637;
            hand = 12758;
            leg = 12888;
            feet = 13009;
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
        [1]= function (x)
            if not(player:hasItem(16534)) then
                player:addItem(16534);
            end
        end,

        -- MONK JOB
        [2]= function (x)
            if not(player:hasItem(13184)) then
                player:addItem(13184);
            end
        end,

        -- WHITE MAGE
        [3]= function(x)
            if not(player:hasItem(17068)) then
                player:addItem(17068);
            end

            if not(player:hasItem(4608)) then
            player:addItem(4608);
            end
        end,

        -- BLACK MAGE
        [4] = function(x)

            if not(player:hasItem(17104)) then
                player:addItem(17104);
            end

            if not(player:hasItem(4607)) then
                player:addItem(4607);
            end
        end,

        -- RED MAGE
        [5]= function (x)
            if not(player:hasItem(16482)) then
                player:addItem(16482);
            end
            if not(player:hasItem(4606)) then
                player:addItem(4606);
            end
        end,

        -- THIEF
        [6]= function (x)
            if not(player:hasItem(16483)) then
                player:addItem(16483);
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
                then player:addItem(13495);
            end;
            player:addKeyItem(dsp.ki.MAP_OF_THE_SAN_DORIA_AREA);
        end,

        -- BASTOK CITIZEN
        [1] = function (x)
            if (((race == 1) or (race == 2) or (race == 8)))
                then player:addItem(13497);
            end;
            player:addKeyItem(dsp.ki.MAP_OF_THE_BASTOK_AREA);
        end,

        -- WINDY CITIZEN
        [2] = function(x)
            if (((race == 5) or (race == 6) or (race == 7)))
                then player:addItem(13496);
            end;
            player:addKeyItem(dsp.ki.MAP_OF_THE_WINDURST_AREA);
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
    player:addItem(536);

    --SET TITLE
    player:addTitle(dsp.title.NEW_ADVENTURER);

    -- Needs Moghouse Intro
    player:setVar("MoghouseExplication",1);

    -- Apply New Player Flag
    player:setNewPlayer(true)
end;

function onPlayerLevelUp(player)
end

function onPlayerLevelDown(player)
end
