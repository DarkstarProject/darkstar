-------------------------------------------------
--  Fields of Valor global vars and functions
-------------------------------------------------
require("scripts/globals/regimereward");
require("scripts/globals/regimeinfo");
require("scripts/globals/conquest");
require("scripts/globals/settings");
require("scripts/globals/common");
require("scripts/globals/status");
require("scripts/globals/utils")
require("scripts/globals/msg")


TABS = 12; -- What is this for? Where is it used?

-- key item IDs
ELITE_TRAINING_INTRODUCTION = 1116;
ELITE_TRAINING_CHAPTER_1    = 1117;
ELITE_TRAINING_CHAPTER_2    = 1118;
ELITE_TRAINING_CHAPTER_3    = 1119;
ELITE_TRAINING_CHAPTER_4    = 1120;
ELITE_TRAINING_CHAPTER_5    = 1121;
ELITE_TRAINING_CHAPTER_6    = 1122;
ELITE_TRAINING_CHAPTER_7    = 1123;

-- EVENT PARAM ID CONSTANTS (change these if even seqs displayed break!)
-- onEventUpdate params
FOV_MENU_PAGE_1      = 18;
FOV_MENU_PAGE_2      = 34;
FOV_MENU_PAGE_3      = 50;
FOV_MENU_PAGE_4      = 66;
FOV_MENU_PAGE_5      = 82;
FOV_MENU_VIEW_REGIME = 1;
FOV_MENU_LEVEL_RANGE = 6;
-- onEventFinish params
FOV_MENU_REGEN            = 53;
FOV_MENU_REFRESH          = 69;
FOV_MENU_PROTECT          = 85;
FOV_MENU_SHELL            = 101;
FOV_MENU_DRIED_MEAT       = 117;
FOV_MENU_SALTED_FISH      = 133;
FOV_MENU_HARD_COOKIE      = 149;
FOV_MENU_INSTANT_NOODLES  = 165;
FOV_MENU_RERAISE         = 37;
FOV_MENU_HOME_NATION     = 21;
FOV_MENU_CANCEL_REGIME   = 3;
FOV_MENU_ELITE_INTRO     = 36;
FOV_MENU_ELITE_CHAP1     = 52;
FOV_MENU_ELITE_CHAP2     = 68;
FOV_MENU_ELITE_CHAP3     = 84;
FOV_MENU_ELITE_CHAP4     = 100;
FOV_MENU_ELITE_CHAP5     = 116;
FOV_MENU_ELITE_CHAP6     = 132;
FOV_MENU_ELITE_CHAP7     = 148;


-- MESSAGE ID CONSTANTS (msg id of "new training regime registered!": change this if msg ids break!)
FOV_MSG_EAST_RONFAURE   = 9862;
FOV_MSG_WEST_RONFAURE   = 10418;
FOV_MSG_NORTH_GUSTABERG = 10390;
FOV_MSG_SOUTH_GUSTABERG = 9890;
FOV_MSG_WEST_SARUTA     = 10180;
FOV_MSG_EAST_SARUTA     = 9916;
FOV_MSG_KONSCHTAT       = 9777;
FOV_MSG_TAHRONGI        = 9815;
FOV_MSG_LA_THEINE       = 10115;
FOV_MSG_PASHHOW         = 10703;
FOV_MSG_JUGNER          = 10849;
FOV_MSG_MERIPH          = 10582;
FOV_MSG_BATALLIA        = 9973;
FOV_MSG_SAUROMAGUE      = 9803;
FOV_MSG_ROLANBERRY      = 9764;
FOV_MSG_VALKURM         = 10257;
FOV_MSG_BUBURIMU        = 10283;
FOV_MSG_QUFIM           = 10325;
FOV_MSG_RUAUN_GARDENS   = 9722;
FOV_MSG_BEAUCEDINE      = 10741;
FOV_MSG_YUHTUNGA        = 10043;
FOV_MSG_YHOATOR         = 9994;
FOV_MSG_WEST_ALTEPA     = 9804;
FOV_MSG_EAST_ALTEPA     = 9942;
FOV_MSG_XARCABARD       = 10343;
FOV_MSG_BEHEMOTH        = 9526;
FOV_MSG_ZITAH           = 10260;
FOV_MSG_ROMAEVE         = 9609;
FOV_MSG_TERIGGAN        = 10103;
FOV_MSG_SORROWS         = 9681;

-- Event IDs
FOV_EVENT_RUAUN_GARDENS   = 0x0049;
FOV_EVENT_EAST_RONFAURE   = 0x003d;
FOV_EVENT_WEST_RONFAURE   = 0x003d;
FOV_EVENT_WEST_SARUTA     = 0x0034;
FOV_EVENT_EAST_SARUTA     = 0x003d;
FOV_EVENT_NORTH_GUSTABERG = 0x010a;
FOV_EVENT_SOUTH_GUSTABERG = 0x003d;
FOV_EVENT_LA_THEINE       = 0x003d;
FOV_EVENT_KONSCHTAT       = 0x003d;
FOV_EVENT_TAHRONGI        = 0x003d;
FOV_EVENT_PASHHOW         = 0x001c;
FOV_EVENT_JUGNER          = 0x0020;
FOV_EVENT_MERIPH          = 0x002e;
FOV_EVENT_BATALLIA        = 0x003d;
FOV_EVENT_SAUROMAGUE      = 0x003d;
FOV_EVENT_ROLANBERRY      = 0x003d;
FOV_EVENT_VALKURM         = 0x002f;
FOV_EVENT_BUBURIMU        = 0x0033;
FOV_EVENT_QUFIM           = 0x0021;
FOV_EVENT_YUHTUNGA        = 0x003d;
FOV_EVENT_YHOATOR         = 0x003d;
FOV_EVENT_WEST_ALTEPA     = 0x003d;
FOV_EVENT_EAST_ALTEPA     = 0x003d; -- test
FOV_EVENT_BEAUCEDINE      = 0x00da;
FOV_EVENT_XARCABARD       = 0x0030;
FOV_EVENT_BEHEMOTH        = 0x003d;
FOV_EVENT_ZITAH           = 0x003d;
FOV_EVENT_ROMAEVE         = 0x003d;
FOV_EVENT_TERIGGAN        = 0x003d; -- test
FOV_EVENT_SORROWS         = 0x003d;

----------------------------------
-- Start FoV onTrigger
----------------------------------

function startFov(eventid, player)
    if (ENABLE_FIELD_MANUALS == 1) then
        local hasRegime = player:getVar("fov_regimeid");
        local tabs = player:getCurrency("valor_point");
        player:startEvent(eventid, 0, 0, 0, 0, 0, 0, tabs, hasRegime);
    else
        player:PrintToPlayer("Disabled.");
    end
end;

----------------------------------
-- Update FoV onEventUpdate
----------------------------------

function updateFov(player, csid, menuchoice, r1, r2, r3, r4, r5)

    if (menuchoice == FOV_MENU_PAGE_1) then
        local info = getRegimeInfo(r1);
        player:updateEvent(info[1], info[2], info[3], info[4], 0, info[5], info[6], r1);

    elseif (menuchoice == FOV_MENU_PAGE_2) then
        local info = getRegimeInfo(r2);
        player:updateEvent(info[1], info[2], info[3], info[4], 0, info[5], info[6], r2);

    elseif (menuchoice == FOV_MENU_PAGE_3) then
        local info = getRegimeInfo(r3);
        player:updateEvent(info[1], info[2], info[3], info[4], 0, info[5], info[6], r3);

    elseif (menuchoice == FOV_MENU_PAGE_4) then
        local info = getRegimeInfo(r4);
        player:updateEvent(info[1], info[2], info[3], info[4], 0, info[5], info[6], r4);

    elseif (menuchoice == FOV_MENU_PAGE_5) then
        local info = getRegimeInfo(r5);
        player:updateEvent(info[1], info[2], info[3], info[4], 0, info[5], info[6], r5);

    elseif (menuchoice == FOV_MENU_VIEW_REGIME) then -- View Regime (this option is only available if they have a regime active!)
        -- get regime id and numbers killed...
        local regid = player:getVar("fov_regimeid");
        local info = getRegimeInfo(regid);

        if (info[1] ~= 0) then n1 = player:getVar("fov_numkilled1"); else n1 = 0; end;
        if (info[2] ~= 0) then n2 = player:getVar("fov_numkilled2"); else n2 = 0; end;
        if (info[3] ~= 0) then n3 = player:getVar("fov_numkilled3"); else n3 = 0; end;
        if (info[4] ~= 0) then n4 = player:getVar("fov_numkilled4"); else n4 = 0; end;

        player:updateEvent(info[1], info[2], info[3], info[4], n1, n2, n3, n4);

    elseif (menuchoice == FOV_MENU_LEVEL_RANGE) then -- Level range and training area on View Regime...
        local regid = player:getVar("fov_regimeid");
        local info = getRegimeInfo(regid);

        player:updateEvent(0, 0, 0, 0, 0, info[5], info[6], 0);
    end

end

------------------------------------------
-- Finish FoV onEventFinish
------------------------------------------

function finishFov(player, csid, option, r1, r2, r3, r4, r5, msg_offset)

    local msg_accept = msg_offset;
    local msg_jobs = msg_offset + 1;
    local msg_cancel = msg_offset +2;
    local tabs = player:getCurrency("valor_point");
    local HAS_FOOD = player:hasStatusEffect(dsp.effects.FOOD);
    local HAS_SUPPORT_FOOD = player:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD);
    local fov_repeat = bit.band(option, 0x80000000);

    if (fov_repeat ~= 0) then
        fov_repeat = 1;
    end

    option = bit.band(option, 0x7FFFFFFF);

    -- ================= FIELD SUPPORT ===============================================
    if (option == FOV_MENU_REGEN) then -- Chose Regen. Regen from FoV removes all forms of regen.
        -- Decrease tabs
        if (tabs >= 20) then
            player:delCurrency("valor_point", 20);
            -- Removes regen if on player
            player:delStatusEffect(dsp.effects.REGEN);
            -- Adds regen
            player:addStatusEffect(dsp.effects.REGEN, 1, 3, 3600);
        end

    elseif (option == FOV_MENU_REFRESH) then -- Chose Refresh, removes all other refresh.
        -- Decrease tabs
        if (tabs >= 20) then
            player:delCurrency("valor_point", 20);
            -- Removes refresh if on player
            player:delStatusEffect(dsp.effects.REFRESH);
            player:delStatusEffect(dsp.effects.SUBLIMATION_COMPLETE);
            player:delStatusEffect(dsp.effects.SUBLIMATION_ACTIVATED);
            -- Add refresh
            player:addStatusEffect(dsp.effects.REFRESH, 1, 3, 3600, 0, 3);
        end

    elseif (option == FOV_MENU_PROTECT) then -- Chose Protect, removes all other protect.
        -- Decrease tabs
        if (tabs >= 15) then
            player:delCurrency("valor_point", 15);
            -- Removes protect if on player
            player:delStatusEffect(dsp.effects.PROTECT);
            -- Work out how much def to give (highest tier dependant on level)
            local def = 0;
            if (player:getMainLvl() < 27) then -- before protect 2, give protect 1
                def = 15;
            elseif (player:getMainLvl() < 47) then -- after p2, before p3
                def = 40;
            elseif (player:getMainLvl() < 63) then -- after p3, before p4
                def = 75;
            else -- after p4
                def = 120;
            end
            -- Add protect
            player:addStatusEffect(dsp.effects.PROTECT, def, 0, 1800);
        end

    elseif (option == FOV_MENU_SHELL) then -- Chose Shell, removes all other shell.
        -- Decrease tabs
        if (tabs >= 15) then
            player:delCurrency("valor_point", 15);
            -- Removes shell if on player
            player:delStatusEffect(dsp.effects.SHELL);
            -- Work out how much mdef to give (highest tier dependant on level)
            -- values taken from Shell scripts by Tenjou.
            local def = 0;
            if (player:getMainLvl() < 37) then -- before shell 2, give shell 1
                def = 9;
            elseif (player:getMainLvl() < 57) then -- after s2, before s3
                def = 14;
            elseif (player:getMainLvl() < 68) then -- after s3, before s4
                def = 19;
            else -- after s4
                def = 22;
            end
            -- Add shell
            player:addStatusEffect(dsp.effects.SHELL, def, 0, 1800);
        end

    elseif (option == FOV_MENU_RERAISE) then -- Reraise chosen.
        -- Decrease tabs
        if (tabs >= 10) then
            player:delCurrency("valor_point", 10);
            -- Remove any other RR
            player:delStatusEffect(dsp.effects.RERAISE);
            -- apply RR1, 2 hour duration.
            player:addStatusEffect(dsp.effects.RERAISE, 1, 0, 7200);
        end

    elseif (option == FOV_MENU_HOME_NATION) then -- Return to home nation.
        -- Decrease tabs
        if (tabs >= 50) then
            player:delCurrency("valor_point", 50);
            toHomeNation(player); -- Needs an entry in scripts/globals/teleports.lua?
        end

    elseif (option == FOV_MENU_DRIED_MEAT) then -- Dried Meat: STR+4, Attack +22% (caps at 63)
        if (tabs >= 50) then
            if (HAS_FOOD == true or HAS_SUPPORT_FOOD == true) then
                player:messageBasic(msgBasic.IS_FULL);
            else
                player:delCurrency("valor_point", 50);
                player:addStatusEffectEx(dsp.effects.FIELD_SUPPORT_FOOD, 251, 1, 0, 1800);
            end
        end

    elseif (option == FOV_MENU_SALTED_FISH) then -- Salted Fish: VIT+2 DEF+30% (Caps at 86)
        if (tabs >= 50) then
            if (HAS_FOOD == true or HAS_SUPPORT_FOOD == true) then
                player:messageBasic(msgBasic.IS_FULL);
            else
                player:delCurrency("valor_point", 50);
                player:addStatusEffectEx(dsp.effects.FIELD_SUPPORT_FOOD, 251, 2, 0, 1800);
            end
        end

    elseif (option == FOV_MENU_HARD_COOKIE) then --- Hard Cookie: INT+4, MaxMP+30
        if (tabs >= 50) then
            if (HAS_FOOD == true or HAS_SUPPORT_FOOD == true) then
                player:messageBasic(msgBasic.IS_FULL);
            else
                player:delCurrency("valor_point", 50);
                player:addStatusEffectEx(dsp.effects.FIELD_SUPPORT_FOOD, 251, 3, 0, 1800);
            end
        end

    elseif (option == FOV_MENU_INSTANT_NOODLES) then -- Instant Noodles: VIT+1, Max HP+27% (caps at 75), StoreTP+5
        if (tabs >= 50) then
            if (HAS_FOOD == true or HAS_SUPPORT_FOOD == true) then
                player:messageBasic(msgBasic.IS_FULL);
            else
                player:delCurrency("valor_point", 50);
                player:addStatusEffectEx(dsp.effects.FIELD_SUPPORT_FOOD, 251, 4, 0, 1800);
            end
        end

    elseif (option == FOV_MENU_CANCEL_REGIME) then -- Cancelled Regime.
        player:setVar("fov_regimeid" , 0);
        player:setVar("fov_numkilled1", 0);
        player:setVar("fov_numkilled2", 0);
        player:setVar("fov_numkilled3", 0);
        player:setVar("fov_numkilled4", 0);
        player:showText(player, msg_cancel);

    elseif (option == FOV_MENU_PAGE_1) then -- Page 1
        writeRegime(player, r1, msg_accept, msg_jobs, fov_repeat);

    elseif (option == FOV_MENU_PAGE_2) then -- Page 2
        writeRegime(player, r2, msg_accept, msg_jobs, fov_repeat);

    elseif (option == FOV_MENU_PAGE_3) then -- Page 3
        writeRegime(player, r3, msg_accept, msg_jobs, fov_repeat);

    elseif (option == FOV_MENU_PAGE_4) then -- Page 4
        writeRegime(player, r4, msg_accept, msg_jobs, fov_repeat);

    elseif (option == FOV_MENU_PAGE_5) then -- Page 5
        writeRegime(player, r5, msg_accept, msg_jobs, fov_repeat);

    elseif (option == FOV_MENU_ELITE_INTRO) then -- Want elite, 100tabs
        -- giveEliteRegime(player, ELITE_TRAINING_CHAPTER_7, 100);

    elseif (option == FOV_MENU_ELITE_CHAP1) then -- Want elite, 150tabs
        -- local tabs = player:getVar("tabs");
        -- local newtabs = tabs-150;
        -- player:setVar("tabs", newtabs);

    elseif (option == FOV_MENU_ELITE_CHAP2) then -- Want elite, 200tabs
        -- local tabs = player:getVar("tabs");
        -- local newtabs = tabs-200;
        -- player:setVar("tabs", newtabs);

    elseif (option == FOV_MENU_ELITE_CHAP3) then -- Want elite, 250tabs

    elseif (option == FOV_MENU_ELITE_CHAP4) then -- Want elite, 300tabs

    elseif (option == FOV_MENU_ELITE_CHAP5) then -- Want elite, 350tabs

    elseif (option == FOV_MENU_ELITE_CHAP6) then -- Want elite, 400tabs

    elseif (option == FOV_MENU_ELITE_CHAP7) then -- Want elite, 450tabs

    else
        -- print("opt is "..option);
    end

end

function giveEliteRegime(player, keyitem, cost)
    if (not player:hasKeyItem(keyitem)) then
        player:delCurrency("valor_point", cost);
        player:addKeyItem(keyitem);
    end
end

-----------------------------------
-- Writes the chosen Regime to the SQL database
-----------------------------------

function writeRegime(player, rid, msg_accept, msg_jobs, regrepeat)

    local info = getRegimeInfo(rid);

    player:setVar("fov_regimeid", rid);
    player:setVar("fov_repeat", regrepeat);

    for i = 1, 4 do
        player:setVar("fov_numkilled"..i, 0);
        player:setVar("fov_numneeded"..i, info[i]);
    end;

    player:showText(player, msg_accept);
    player:showText(player, msg_jobs);

end

-----------------------------------
-- player, mob, regime ID, index in the list of mobs to kill that this mob corresponds to (1-4)
-----------------------------------

function checkRegime(player, mob, rid, index)
    -- dead people get no point
    if (player == nil or player:getHP() == 0) then
        return;
    end

    local partyType = player:checkSoloPartyAlliance();

    if (player:checkFovAllianceAllowed() == 1) then
        partyType = 1;
    end

    if (player:getVar("fov_regimeid") == rid) then -- player is doing this regime

        if (partyType < 2 and (player:checkValorCredit(mob) == true or LOW_LEVEL_REGIME == 1)) then
            -- get the number of mobs needed/killed
            local needed = player:getVar("fov_numneeded"..index);
            local killed = player:getVar("fov_numkilled"..index);

            if (killed < needed) then -- increment killed number and save.
                killed = killed + 1;
                player:messageBasic(msgBasic.FOV_DEFEATED_TARGET, killed, needed);
                player:setVar("fov_numkilled"..index, killed);

                if (killed == needed) then
                    local fov_info = getRegimeInfo(rid);
                    local k1 = player:getVar("fov_numkilled1");
                    local k2 = player:getVar("fov_numkilled2");
                    local k3 = player:getVar("fov_numkilled3");
                    local k4 = player:getVar("fov_numkilled4");

                    if (k1 == fov_info[1] and k2 == fov_info[2] and k3 == fov_info[3] and k4 == fov_info[4]) then
                        -- complete regime
                        player:messageBasic(msgBasic.FOV_COMPLETED_REGIME);
                        local reward = getFoVregimeReward(rid);
                        local tabs = (math.floor(reward / 10) * TABS_RATE);
                        local VanadielEpoch = vanaDay();

                        -- Award gil and tabs once per day.
                        if (player:getVar("fov_LastReward") < VanadielEpoch) then
                            local CAP = 50000; -- Retail caps it at 50k
                            if (tabs + player:getCurrency("valor_point") > CAP) then
                                tabs = utils.clamp(CAP - player:getCurrency("valor_point"),0,CAP);
                            end
                            player:messageBasic(msgBasic.FOV_OBTAINS_GIL, reward);
                            player:addGil(reward);
                            player:addCurrency("valor_point", tabs);
                            player:messageBasic(msgBasic.FOV_OBTAINS_TABS, tabs, player:getCurrency("valor_point")); -- Careful about order.
                            if (REGIME_WAIT == 1) then
                                player:setVar("fov_LastReward", VanadielEpoch);
                            end
                        end

                        -- TODO: display msgs (based on zone annoyingly, so will need player:getZoneID() then a lookup)
                        player:addExp(reward);
                        if (k1 ~= 0) then player:setVar("fov_numkilled1", 0); end
                        if (k2 ~= 0) then player:setVar("fov_numkilled2", 0); end
                        if (k3 ~= 0) then player:setVar("fov_numkilled3", 0); end
                        if (k4 ~= 0) then player:setVar("fov_numkilled4", 0); end

                        if (player:getVar("fov_repeat") ~= 1) then
                            player:setVar("fov_regimeid", 0);
                            player:setVar("fov_numneeded1", 0);
                            player:setVar("fov_numneeded2", 0);
                            player:setVar("fov_numneeded3", 0);
                            player:setVar("fov_numneeded4", 0);
                        else
                           player:messageBasic(msgBasic.FOV_REGIME_BEGINS_ANEW);
                        end
                    end
                end
            end
        end
    end

end
