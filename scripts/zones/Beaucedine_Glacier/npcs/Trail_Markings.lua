-----------------------------------
-- Area: Beaucedine Glacier
--  NPC: Trail Markings
-- Dynamis-Beaucedine Enter
-- !pos -284 -39 -422 111
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/dynamis");
local ID = require("scripts/zones/Beaucedine_Glacier/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getVar("DynaBeaucedine_Win") == 1) then
        player:startEvent(134,dsp.ki.HYDRA_CORPS_INSIGNIA); -- Win CS
    elseif (player:hasKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND) and player:hasKeyItem(dsp.ki.HYDRA_CORPS_COMMAND_SCEPTER) and
            player:hasKeyItem(dsp.ki.HYDRA_CORPS_EYEGLASS) and player:hasKeyItem(dsp.ki.HYDRA_CORPS_LANTERN) and player:hasKeyItem(dsp.ki.HYDRA_CORPS_TACTICAL_MAP)) then
        local firstDyna = 0;
        local realDay = os.time();
        local dynaWaitxDay = player:getVar("dynaWaitxDay");
        local dynaUniqueID = GetServerVariable("[DynaBeaucedine]UniqueID");

        if (checkFirstDyna(player,5)) then  -- First Dyna-Beuc => CS
            firstDyna = 1;
        end

        if (player:getMainLvl() < DYNA_LEVEL_MIN) then
            player:messageSpecial(ID.text.PLAYERS_HAVE_NOT_REACHED_LEVEL,DYNA_LEVEL_MIN);
        elseif ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) < realDay or (player:getVar("DynamisID") == dynaUniqueID and dynaUniqueID > 0)) then
            player:startEvent(119,5,firstDyna,0,BETWEEN_2DYNA_WAIT_TIME,64,dsp.ki.VIAL_OF_SHROUDED_SAND,4236,4237);
        else
            dayRemaining = math.floor(((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) - realDay)/3456);
            player:messageSpecial(ID.text.YOU_CANNOT_ENTER_DYNAMIS,dayRemaining,5);
        end
    else
        player:messageSpecial(ID.text.UNUSUAL_ARRANGEMENT_OF_BRANCHES);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("updateRESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("finishRESULT: %u",option);
    if (csid == 134) then
        player:setVar("DynaBeaucedine_Win",0);
    elseif (csid == 119 and option == 0) then
        if (checkFirstDyna(player,5)) then
            player:setVar("Dynamis_Status",bit.bor(player:getVar("Dynamis_Status"),32));
        end
        player:setVar("enteringDynamis",1);
        player:setPos(-284.751,-39.923,-422.948,235,134);
    end
end;