-------------------------------------------------
-- Largely based on the existing fieldsofvalor.lua
--
-- Info from:
--   http://www.bg-wiki.com/bg/Grounds_Tome
--   http://wiki.ffxiclopedia.org/wiki/Grounds_Tome
--
-------------------------------------------------
require("scripts/globals/utils")
require("scripts/globals/common");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/conquest");
require("scripts/globals/teleports");
require("scripts/globals/regimereward");
require("scripts/globals/regimeinfo");

-----------------------------------
-- onEventUpdate params
-----------------------------------

GOV_MENU_PAGE_1         = 18;
GOV_MENU_PAGE_2         = 34;
GOV_MENU_PAGE_3         = 50;
GOV_MENU_PAGE_4         = 66;
GOV_MENU_PAGE_5         = 82;
GOV_MENU_PAGE_6         = 98;
GOV_MENU_PAGE_7         = 114;
GOV_MENU_PAGE_8         = 130;
GOV_MENU_PAGE_9         = 146;
GOV_MENU_PAGE_10        = 162;
GOV_MENU_VIEW_REGIME    = 1;
GOV_MENU_LEVEL_RANGE    = 5;
GOV_MENU_REVIEW_PROWESS = 7;

-----------------------------------
-- onEventFinish params
-----------------------------------

GOV_MENU_REPATRIATION    = 20;
GOV_MENU_CIRCUMSPECTION  = 36;
GOV_MENU_HOMING_INSTINCT = 52;
GOV_MENU_RERAISE         = 68;
GOV_MENU_RERAISE_II      = 84;
GOV_MENU_RERAISE_III     = 100;
GOV_MENU_REGEN           = 116;
GOV_MENU_REFRESH         = 132;
GOV_MENU_PROTECT         = 148;
GOV_MENU_SHELL           = 164;
GOV_MENU_HASTE           = 180;
GOV_MENU_DRIED_MEAT      = 196;
GOV_MENU_SALTED_FISH     = 212;
GOV_MENU_HARD_COOKIE     = 228;
GOV_MENU_INSTANT_NOODLES = 244;
GOV_MENU_DRIED_AGARICUS  = 260;
GOV_MENU_INSTANT_RICE    = 276;
GOV_MENU_CIPHER_SAKURA   = 292;
GOV_MENU_CANCEL_REGIME   = 3;

-----------------------------------
-- Message IDs
-----------------------------------

-- On polutils dialog strings menu "Other" -> "System messages (4)".
GOV_MSG_KILLED_TARGET    = 558;
GOV_MSG_COMPLETED_REGIME = 559;
GOV_MSG_GET_GIL          = 565;
GOV_MSG_GET_TABS         = 566;
GOV_MSG_BEGINS_ANEW      = 643;

-- Per zone msg ID of "new training regime registered!"
-- Change these if text IDs get moved by a client update.
GOV_MSG_RANGUEMONT_PASS        = 9483;
GOV_MSG_BOSTAUNIEUX_OUBLIETTE  = 9498;
GOV_MSG_TORAIMARAI_CANAL       = 9582;
GOV_MSG_ZERUHN_MINES           = 9456;
GOV_MSG_KING_RANPERRES_TOMB    = 10300;
GOV_MSG_DANGRUF_WADI           = 10416;
GOV_MSG_INNER_HORUTOTO_RUINS   = 9457;
GOV_MSG_ORDELLES_CAVES         = 10425;
GOV_MSG_OUTER_HORUTOTO_RUINS   = 10313;
GOV_MSG_ELDIEME_NECROPOLIS     = 9636;
GOV_MSG_GUSGEN_MINES           = 10345;
GOV_MSG_CRAWLERS_NEST          = 9398;
GOV_MSG_MAZE_OF_SHAKHRAMI      = 10316;
GOV_MSG_GARLAIGE_CITADEL       = 9569;
GOV_MSG_FEIYIN                 = 9558;
GOV_MSG_BOYAHDA_TREE           = 10301;
GOV_MSG_KORROLOKA_TUNNEL       = 9423;
GOV_MSG_KUFTAL_TUNNEL          = 10300;
GOV_MSG_VELUGANNON_PALACE      = 10129;
GOV_MSG_SHRINE_OF_RUAVITAU     = 10305;
GOV_MSG_IFRITS_CAULDRON        = 10392;
GOV_MSG_GUSTAV_TUNNEL          = 9522;
GOV_MSG_LABYRINTH_OF_ONZOZO    = 9353;
GOV_MSG_LOWER_DELKFUTTS_TOWER  = 10673;
GOV_MSG_MIDDLE_DELKFUTTS_TOWER = 9419;
GOV_MSG_UPPER_DELKFUTTS_TOWER  = 9425;
GOV_MSG_TEMPLE_OF_UGGALEPIH    = 10488;
GOV_MSG_DEN_OF_RANCOR          = 9452;
GOV_MSG_SEA_SERPENT_GROTTO     = 9647;
GOV_MSG_QUICKSAND_CAVES        = 10327;

-----------------------------------
-- Event IDs
-----------------------------------

GOV_EVENT_RANGUEMONT_PASS        = 24;
GOV_EVENT_BOSTAUNIEUX_OUBLIETTE  = 114;
GOV_EVENT_TORAIMARAI_CANAL       = 100;
GOV_EVENT_ZERUHN_MINES           = 210;
GOV_EVENT_KING_RANPERRES_TOMB    = 100;
GOV_EVENT_DANGRUF_WADI           = 160;
GOV_EVENT_INNER_HORUTOTO_RUINS   = 100;
GOV_EVENT_ORDELLES_CAVES         = 100;
GOV_EVENT_OUTER_HORUTOTO_RUINS   = 110;
GOV_EVENT_ELDIEME_NECROPOLIS     = 100;
GOV_EVENT_GUSGEN_MINES           = 100;
GOV_EVENT_CRAWLERS_NEST          = 100;
GOV_EVENT_MAZE_OF_SHAKHRAMI      = 100;
GOV_EVENT_GARLAIGE_CITADEL       = 110;
GOV_EVENT_FEIYIN                 = 100;
GOV_EVENT_BOYAHDA_TREE           = 17;
GOV_EVENT_KORROLOKA_TUNNEL       = 4;
GOV_EVENT_KUFTAL_TUNNEL          = 29;
GOV_EVENT_VELUGANNON_PALACE      = 4;
GOV_EVENT_SHRINE_OF_RUAVITAU     = 61;
GOV_EVENT_IFRITS_CAULDRON        = 51;
GOV_EVENT_GUSTAV_TUNNEL          = 17;
GOV_EVENT_LABYRINTH_OF_ONZOZO    = 3;
GOV_EVENT_LOWER_DELKFUTTS_TOWER  = 40;
GOV_EVENT_MIDDLE_DELKFUTTS_TOWER = 18;
GOV_EVENT_UPPER_DELKFUTTS_TOWER  = 20;
GOV_EVENT_TEMPLE_OF_UGGALEPIH    = 83;
GOV_EVENT_DEN_OF_RANCOR          = 13;
GOV_EVENT_SEA_SERPENT_GROTTO     = 24;
GOV_EVENT_QUICKSAND_CAVES        = 15;

----------------------------------
-- GoV onTrigger
----------------------------------

function startGov(eventid,player)
    if (ENABLE_GROUNDS_TOMES == 1) then
        local hasRegime = player:getVar("fov_regimeid");
        local tabs = player:getCurrency("valor_point");
        player:startEvent(eventid,0,0,0,0,0,0,tabs,hasRegime);
    else
        player:PrintToPlayer("Disabled.");
    end
end;

----------------------------------
-- GoV onEventUpdate
----------------------------------

function updateGov(player,csid,menuchoice,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10)
    if (menuchoice == GOV_MENU_PAGE_1) then
        local info = getRegimeInfo(r1);
        player:updateEvent(info[1],info[2],info[3],info[4],0,info[5],info[6],r1);
    elseif (menuchoice == GOV_MENU_PAGE_2) then
        local info = getRegimeInfo(r2);
        player:updateEvent(info[1],info[2],info[3],info[4],0,info[5],info[6],r2);
    elseif (menuchoice == GOV_MENU_PAGE_3) then
        local info = getRegimeInfo(r3);
        player:updateEvent(info[1],info[2],info[3],info[4],0,info[5],info[6],r3);
    elseif (menuchoice == GOV_MENU_PAGE_4) then
        local info = getRegimeInfo(r4);
        player:updateEvent(info[1],info[2],info[3],info[4],0,info[5],info[6],r4);
    elseif (menuchoice == GOV_MENU_PAGE_5) then
        local info = getRegimeInfo(r5);
        player:updateEvent(info[1],info[2],info[3],info[4],0,info[5],info[6],r5);
    elseif (menuchoice == GOV_MENU_PAGE_6) then
        local info = getRegimeInfo(r6);
        player:updateEvent(info[1],info[2],info[3],info[4],0,info[5],info[6],r6);
    elseif (menuchoice == GOV_MENU_PAGE_7) then
        local info = getRegimeInfo(r7);
        player:updateEvent(info[1],info[2],info[3],info[4],0,info[5],info[6],r7);
    elseif (menuchoice == GOV_MENU_PAGE_8) then
        local info = getRegimeInfo(r8);
        player:updateEvent(info[1],info[2],info[3],info[4],0,info[5],info[6],r8);
    elseif (menuchoice == GOV_MENU_PAGE_9) then
        local info = getRegimeInfo(r9);
        player:updateEvent(info[1],info[2],info[3],info[4],0,info[5],info[6],r9);
    elseif (menuchoice == GOV_MENU_PAGE_10) then
        local info = getRegimeInfo(r10);
        player:updateEvent(info[1],info[2],info[3],info[4],0,info[5],info[6],r10);
    elseif (menuchoice == GOV_MENU_VIEW_REGIME) then -- View Regime (this option is only available if they have a regime active!)
        -- Get regime ID and numbers killed...
        local regid = player:getVar("fov_regimeid");
        local info = getRegimeInfo(regid);
        if (info[1] ~= 0) then
            n1 = player:getVar("fov_numkilled1");
        else
            n1 = 0;
        end;
        if (info[2] ~= 0) then
            n2 = player:getVar("fov_numkilled2");
        else
            n2 = 0;
        end;
        if (info[3] ~= 0) then
            n3 = player:getVar("fov_numkilled3");
        else
            n3 = 0;
        end;
        if (info[4] ~= 0) then
            n4 = player:getVar("fov_numkilled4");
        else
            n4 = 0;
        end;
        player:updateEvent(info[1],info[2],info[3],info[4],n1,n2,n3,n4);
    elseif (menuchoice == GOV_MENU_LEVEL_RANGE) then -- Level range and training area on View Regime...
        local regid = player:getVar("fov_regimeid");
        local info = getRegimeInfo(regid);
        player:updateEvent(0,0,0,0,0,info[5],info[6],0);
    elseif (menuchoice == GOV_MENU_REVIEW_PROWESS) then
        local part1 = 0;
        local part2 = 0;
        -- Todo: work out the display
        player:updateEvent(part1,part2,0,0,0,0,0,0);
    end
end

------------------------------------------
-- GoV onEventFinish
------------------------------------------

function finishGov(player,csid,option,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,msg_offset)
    local msg_accept = msg_offset;
    local msg_jobs = msg_offset+1;
    local msg_cancel = msg_offset+2;
    local tabs = player:getCurrency("valor_point");
    local HAS_FOOD = player:hasStatusEffect(EFFECT_FOOD);
    local HAS_SUPPORT_FOOD = player:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD);
    local fov_repeat = bit.band(option, 0x80000000);

    if (fov_repeat ~= 0) then
        fov_repeat = 1;
    end

    option = bit.band(option, 0x7FFFFFFF);

-- ================= FIELD SUPPORT ============================================
    if (option == GOV_MENU_REPATRIATION) then -- Send to home nation
        if (tabs >= 50) then
            player:delCurrency("valor_point", 50);
            toHomeNation(player);
        end
    elseif (option == GOV_MENU_CIRCUMSPECTION) then -- Sneak + Invis
        if (tabs >= 5) then
            player:delCurrency("valor_point", 5);
            player:delStatusEffect(EFFECT_SNEAK);
            player:addStatusEffect(EFFECT_SNEAK,0,10,900);
            player:delStatusEffect(EFFECT_INVISIBLE);
            player:addStatusEffect(EFFECT_INVISIBLE,0,10,900);
        end
    elseif (option == GOV_MENU_HOMING_INSTINCT) then -- Send to Homepoint
        if (tabs >= 50) then
            player:delCurrency("valor_point", 50);
            player:addStatusEffectEx(EFFECT_TELEPORT,0,TELEPORT_WARP,0,1);
        end
    elseif (option == GOV_MENU_RERAISE) then -- Reraise 1
        if (tabs >= 10) then
            player:delCurrency("valor_point", 10);
            player:delStatusEffect(EFFECT_RERAISE);
            player:addStatusEffect(EFFECT_RERAISE,1,0,7200);
        end
    elseif (option == GOV_MENU_RERAISE_II) then -- Reraise 2
        if (tabs >= 20) then
            player:delCurrency("valor_point", 20);
            player:delStatusEffect(EFFECT_RERAISE);
            player:addStatusEffect(EFFECT_RERAISE,2,0,7200);
        end
    elseif (option == GOV_MENU_RERAISE_III) then -- ReRaise 3
        if (tabs >= 30) then
            player:delCurrency("valor_point", 30);
            player:delStatusEffect(EFFECT_RERAISE);
            player:addStatusEffect(EFFECT_RERAISE,3,0,7200);
        end
    elseif (option == GOV_MENU_REGEN) then -- Overwrites all other forms of regen.
        if (tabs >= 20) then
            player:delCurrency("valor_point", 20);
            -- Removes regen if on player
            player:delStatusEffect(EFFECT_REGEN);
            -- Adds regen
            player:addStatusEffect(EFFECT_REGEN,1,3,3600);
        end
    elseif (option == GOV_MENU_REFRESH) then -- Overwrites all other forms of refresh.
        if (tabs >= 20) then
            player:delCurrency("valor_point", 20);
            -- Removes refresh if on player
            player:delStatusEffect(EFFECT_REFRESH);
            player:delStatusEffect(EFFECT_SUBLIMATION_COMPLETE);
            player:delStatusEffect(EFFECT_SUBLIMATION_ACTIVATED);
            -- Add refresh
            player:addStatusEffect(EFFECT_REFRESH,1,3,3600, 0, 3);
        end
    elseif (option == GOV_MENU_PROTECT) then -- Overwrites all other forms of protect.
        if (tabs >= 15) then
            player:delCurrency("valor_point", 15);
            -- Removes protect if on player
            player:delStatusEffect(EFFECT_PROTECT);
            -- Work out how much def to give (highest tier dependent on level)
            local def = 0;
            if (player:getMainLvl()<27) then -- Before protect 2, give protect 1
                def = 15;
            elseif (player:getMainLvl()<47) then -- After p2, before p3
                def = 40;
            elseif (player:getMainLvl()<63) then -- After p3, before p4
                def = 75;
            else -- After p4
                def = 120;
            end
            -- Add protect
            player:addStatusEffect(EFFECT_PROTECT,def,0,1800);
        end
    elseif (option == GOV_MENU_SHELL) then -- Overwrites all other forms of shell.
        if (tabs >= 15) then
            player:delCurrency("valor_point", 15);
            -- Removes shell if on player
            player:delStatusEffect(EFFECT_SHELL);
            -- Work out how much mdef to give (highest tier dependent on level)
            -- values taken from Shell scripts by Tenjou.
            local def = 0;
            if (player:getMainLvl()<37) then -- Before shell 2, give shell 1
                def = 24;
            elseif (player:getMainLvl()<57) then -- After s2, before s3
                def = 36;
            elseif (player:getMainLvl()<68) then -- After s3, before s4
                def = 48;
            else -- After s4
                def = 56;
            end
            -- Add shell
            player:addStatusEffect(EFFECT_SHELL,def,0,1800);
        end
    elseif (option == GOV_MENU_HASTE) then -- Wiki info on haste amount is iffy at best. People guessed at 15 and, I went with 10.
        if (tabs >= 20) then
            player:delCurrency("valor_point", 20);
            player:delStatusEffect(EFFECT_HASTE);
            player:addStatusEffect(EFFECT_HASTE,10,0,600);
        end
    elseif (option == GOV_MENU_DRIED_MEAT) then -- Dried Meat: STR+4, Attack +22% (caps at 63)
        if (tabs >= 50) then
            if (HAS_FOOD == true or HAS_SUPPORT_FOOD == true) then
                player:messageBasic(246);
                return;
            else
                player:delCurrency("valor_point", 50);
                player:addStatusEffectEx(EFFECT_FIELD_SUPPORT_FOOD, 251, 1, 0, 1800);
            end
        end
    elseif (option == GOV_MENU_SALTED_FISH) then -- Salted Fish: VIT+2 DEF+30% (Caps at 86)
        if (tabs >= 50) then
            if (HAS_FOOD == true or HAS_SUPPORT_FOOD == true) then
                player:messageBasic(246);
            else
                player:delCurrency("valor_point", 50);
                player:addStatusEffectEx(EFFECT_FIELD_SUPPORT_FOOD, 251, 2, 0, 1800);
            end
        end
    elseif (option == GOV_MENU_HARD_COOKIE) then -- - Hard Cookie: INT+4, MaxMP+30
        if (tabs >= 50) then
            if (HAS_FOOD == true or HAS_SUPPORT_FOOD == true) then
                player:messageBasic(246);
            else
                player:delCurrency("valor_point", 50);
                player:addStatusEffectEx(EFFECT_FIELD_SUPPORT_FOOD, 251, 3, 0, 1800);
            end
        end
    elseif (option == GOV_MENU_INSTANT_NOODLES) then -- Instant Noodles: VIT+1, Max HP+27% (caps at 75), StoreTP+5
        if (tabs >= 50) then
            if (HAS_FOOD == true or HAS_SUPPORT_FOOD == true) then
                player:messageBasic(246);
            else
                player:delCurrency("valor_point", 50);
                player:addStatusEffectEx(EFFECT_FIELD_SUPPORT_FOOD, 251, 4, 0, 1800);
            end
        end
    elseif (option == GOV_MENU_DRIED_AGARICUS) then -- Dried Agaricus: MND+4
        if (tabs >= 50) then
            if (HAS_FOOD == true or HAS_SUPPORT_FOOD == true) then
                player:messageBasic(246);
            else
                player:delCurrency("valor_point", 50);
                player:addStatusEffectEx(EFFECT_FIELD_SUPPORT_FOOD, 251, 5, 0, 1800);
            end
        end
    elseif (option == GOV_MENU_INSTANT_RICE) then -- Instant Rice: CHR+6
        if (tabs >= 50) then
            if (HAS_FOOD == true or HAS_SUPPORT_FOOD == true) then
                player:messageBasic(246);
            else
                player:delCurrency("valor_point", 50);
                player:addStatusEffectEx(EFFECT_FIELD_SUPPORT_FOOD, 251, 6, 0, 1800);
            end
        end
    elseif (option == GOV_MENU_CANCEL_REGIME) then -- Canceled Regime.
        player:setVar("fov_regimeid",0);
        player:setVar("fov_numkilled1",0);
        player:setVar("fov_numkilled2",0);
        player:setVar("fov_numkilled3",0);
        player:setVar("fov_numkilled4",0);
        player:showText(player,msg_cancel);

    elseif (option == GOV_MENU_PAGE_1) then -- Page 1
        writeRegime(player,r1,msg_accept,msg_jobs, fov_repeat);

    elseif (option == GOV_MENU_PAGE_2) then -- Page 2
        writeRegime(player,r2,msg_accept,msg_jobs, fov_repeat);

    elseif (option == GOV_MENU_PAGE_3) then -- Page 3
        writeRegime(player,r3,msg_accept,msg_jobs, fov_repeat);

    elseif (option == GOV_MENU_PAGE_4) then -- Page 4
        writeRegime(player,r4,msg_accept,msg_jobs, fov_repeat);

    elseif (option == GOV_MENU_PAGE_5) then -- Page 5
        writeRegime(player,r5,msg_accept,msg_jobs, fov_repeat);

    elseif (option == GOV_MENU_PAGE_6) then -- Page 6
        writeRegime(player,r6,msg_accept,msg_jobs, fov_repeat);

    elseif (option == GOV_MENU_PAGE_7) then -- Page 7
        writeRegime(player,r7,msg_accept,msg_jobs, fov_repeat);

    elseif (option == GOV_MENU_PAGE_8) then -- Page 8
        writeRegime(player,r8,msg_accept,msg_jobs, fov_repeat);

    elseif (option == GOV_MENU_PAGE_9) then -- Page 9
        writeRegime(player,r9,msg_accept,msg_jobs, fov_repeat);

    elseif (option == GOV_MENU_PAGE_10) then -- Page 10
        writeRegime(player,r10,msg_accept,msg_jobs, fov_repeat);

    else
        -- print("opt is "..option);
    end
end

-----------------------------------
-- Writes the chosen Regime to the SQL database
-----------------------------------

function writeRegime(player,rid,msg_accept,msg_jobs,regrepeat)
    player:setVar("fov_regimeid",rid);
    player:setVar("fov_repeat",regrepeat);
    player:setVar("fov_numkilled1",0);
    player:setVar("fov_numkilled2",0);
    player:setVar("fov_numkilled3",0);
    player:setVar("fov_numkilled4",0);
    local info = getRegimeInfo(rid);
    player:setVar("fov_numneeded1",info[1]);
    player:setVar("fov_numneeded2",info[2]);
    player:setVar("fov_numneeded3",info[3]);
    player:setVar("fov_numneeded4",info[4]);

    player:showText(player,msg_accept);
    player:showText(player,msg_jobs);
end

-----------------------------------
-- player, mob, regime ID, index in the list of mobs to kill that this mob corresponds to (1-4)
-----------------------------------

function checkGoVregime(player,mob,rid,index)
    -- Dead people get no points
    if (player == nil or player:getHP() == 0) then
        return;
    end

    if (player:getVar("fov_regimeid") == rid) then -- Player is doing this regime
        -- Need to add difference because a lvl1 can XP with a level 75 at Ro'Maeve
        local difference = math.abs(mob:getMainLvl() - player:getMainLvl());

        if ((mob:getBaseExp() > 0 or LOW_LEVEL_REGIME == 1) and difference <= 15 and (player:checkDistance(mob) < 100 or player:checkFovDistancePenalty() == 0)) then
            -- Get the number of mobs needed/killed
            local needed = player:getVar("fov_numneeded"..index);
            local killed = player:getVar("fov_numkilled"..index);

            if (killed < needed) then -- Increment killed number and save.
                killed = killed+1;
                player:messageBasic(GOV_MSG_KILLED_TARGET,killed,needed);
                player:setVar("fov_numkilled"..index,killed);

                if (killed == needed) then
                    local fov_info = getRegimeInfo(rid);
                    local k1 = player:getVar("fov_numkilled1");
                    local k2 = player:getVar("fov_numkilled2");
                    local k3 = player:getVar("fov_numkilled3");
                    local k4 = player:getVar("fov_numkilled4");

                    if (k1 == fov_info[1] and k2 == fov_info[2] and k3 == fov_info[3] and k4 == fov_info[4]) then
                        -- Complete regime
                        player:messageBasic(GOV_MSG_COMPLETED_REGIME);
                        local reward = getGoVregimeReward(rid);

                        -- adjust reward down if regime is higher than mob level cap
                        -- example: if you have mobs capped at level 80, and the regime is level 100, you will only get 80% of the reward
                        if NORMAL_MOB_MAX_LEVEL_RANGE_MAX > 0 and fov_info[6] > NORMAL_MOB_MAX_LEVEL_RANGE_MAX then
                            local avgCapLevel = (NORMAL_MOB_MAX_LEVEL_RANGE_MIN + NORMAL_MOB_MAX_LEVEL_RANGE_MAX)/2;
                            local avgMobLevel = (fov_info[5] + fov_info[6])/2;
                            reward = math.floor(reward * avgCapLevel/avgMobLevel);
                        end

                        local RewardCAP = reward * 2;
                        local GoV_clears = 0;
                        local tabs = (math.floor(reward/10)*TABS_RATE);
                        local VanadielEpoch = vanaDay();
                        local RandomProwess = (math.random(777,788));
                        local power = 0;
                        local ProwessMessage = 0; -- Dummy...Gets set proper below.

                        -- Set power of Prowess stuffs, cap at 11 boosts.
                        if (player:hasStatusEffect(RandomProwess) == true) then
                            if (RandomProwess == 780) then
                                power = 1 + player:getStatusEffect(RandomProwess):getPower();
                                if (power > 11) then
                                    power = 11;
                                end
                            elseif (RandomProwess == 782) then
                                power = 1 + player:getStatusEffect(RandomProwess):getPower();
                                if (power > 14) then
                                    power = 14;
                                end
                            elseif (RandomProwess == 787) then
                                power = 2 + player:getStatusEffect(RandomProwess):getPower();
                                if (power > 22) then
                                    power = 22;
                                end
                            else
                                power = 4 + player:getStatusEffect(RandomProwess):getPower();
                                if (power > 44) then
                                    power = 44;
                                end
                            end
                        else
                            if (RandomProwess == 780) then
                                power = 1;
                            elseif (RandomProwess == 782) then
                                power = 3;
                            elseif (RandomProwess == 787) then
                                power = 2;
                            else
                                power = 4;
                            end
                        end

                        -- Apply repeat bonus and Prowess buffs
                        if (player:hasStatusEffect(EFFECT_PROWESS) == true) then
                            GoV_clears = player:getStatusEffect(EFFECT_PROWESS):getPower();
                            reward = reward * ((100+(GoV_clears*4))/100);
                            player:delStatusEffect(EFFECT_PROWESS);
                            player:delStatusEffect(RandomProwess);
                            player:addStatusEffect(EFFECT_PROWESS,(GoV_clears + 1),0,0);
                            player:addStatusEffectEx(RandomProwess,0,power,0,0);
                            ProwessMessage = (RandomProwess - 152);
                        else
                            player:addStatusEffect(EFFECT_PROWESS,1,0,0);
                            player:addStatusEffectEx(RandomProwess,0,power,0,0);
                            ProwessMessage = (RandomProwess - 168);
                        end

                        if (reward > RewardCAP) then
                            reward = RewardCAP;
                        end

                        -- Award gil and tabs once per day.
                        if (player:getVar("fov_LastReward") < VanadielEpoch) then
                            local CAP = 50000; -- Retail caps it at 50k
                            if (tabs + player:getCurrency("valor_point") > CAP) then
                                tabs = utils.clamp(CAP - player:getCurrency("valor_point"),0,CAP);
                            end
                            player:messageBasic(GOV_MSG_GET_GIL,reward);
                            player:addGil(reward);
                            player:addCurrency("valor_point", tabs);
                            player:messageBasic(GOV_MSG_GET_TABS,tabs,player:getCurrency("valor_point")); -- Careful about order.
                            if (REGIME_WAIT == 1) then
                                player:setVar("fov_LastReward",VanadielEpoch);
                            end
                        end

                        -- Give player the candy and inform which Prowess they got.
                        player:addExp(reward);
                        player:messageBasic(ProwessMessage);

                        -- Debugging crap.
                        -- player:PrintToPlayer( string.format( "ProwessID: '%u' ", RandomProwess ) );
                        -- player:PrintToPlayer( string.format( "reward: '%u' ", reward ) );
                        -- player:PrintToPlayer( string.format( "RewardCAP: '%u' ", RewardCAP ) )

                        -- Handle PlayerVars
                        for i = 1, 4 do
                            if player:getVar("fov_numkilled"..i) ~= 0 then
                                player:setVar("fov_numkilled"..i, 0);
                            end
                        end

                        if (player:getVar("fov_repeat") ~= 1) then
                            player:setVar("fov_regimeid",0);
                            player:setVar("fov_numneeded1",0);
                            player:setVar("fov_numneeded2",0);
                            player:setVar("fov_numneeded3",0);
                            player:setVar("fov_numneeded4",0);
                        else
                            player:messageBasic(GOV_MSG_BEGINS_ANEW);
                        end
                    end
                end
            end
        end
    end
end
