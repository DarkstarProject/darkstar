-----------------------------------
-- Area: Buburimu_Peninsula
--  NPC: Hieroglyphics
-- Dynamis Buburimu Enter
-- !pos 163 0 -174 118
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/dynamis");
require("scripts/globals/missions");
local ID = require("scripts/zones/Buburimu_Peninsula/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if ((player:hasCompletedMission(COP,DARKNESS_NAMED) or FREE_COP_DYNAMIS == 1) and player:hasKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND)) then
        local realDay = os.time();
        local dynaWaitxDay = player:getVar("dynaWaitxDay");
        local dynaUniqueID = GetServerVariable("[DynaBuburimu]UniqueID");

        if (checkFirstDyna(player,8)) then
            player:startEvent(40);
        elseif (player:getMainLvl() < DYNA_LEVEL_MIN) then
            player:messageSpecial(ID.text.PLAYERS_HAVE_NOT_REACHED_LEVEL,DYNA_LEVEL_MIN);
        elseif ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) < realDay or (player:getVar("DynamisID") == dynaUniqueID and dynaUniqueID > 0)) then
            player:startEvent(22,8,0,0,BETWEEN_2DYNA_WAIT_TIME,32,dsp.ki.VIAL_OF_SHROUDED_SAND,4236,4237);
        else
            dayRemaining = math.floor(((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) - realDay)/3456);
            player:messageSpecial(ID.text.YOU_CANNOT_ENTER_DYNAMIS,dayRemaining,8);
        end
    else
        player:messageSpecial(ID.text.MYSTERIOUS_VOICE);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("updateRESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("finishRESULT: %u",option);

    if (csid == 40) then
        if (checkFirstDyna(player,8)) then
            player:setVar("Dynamis_Status",bit.bor(player:getVar("Dynamis_Status"),256));
        end
    elseif (csid == 22 and option == 0) then
        player:setVar("enteringDynamis",1);
        player:setPos(155,-1,-169,170,40);
    end
end;