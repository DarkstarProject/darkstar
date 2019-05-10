-----------------------------------
-- Area: Valkurm_Dunes
--  NPC: Hieroglyphics
-- Dynamis Valkurm_Dunes Enter
-- !pos 117 -10 133 103
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/dynamis");
require("scripts/globals/missions");
local ID = require("scripts/zones/Valkurm_Dunes/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if ((player:hasCompletedMission(COP,dsp.mission.id.cop.DARKNESS_NAMED) or FREE_COP_DYNAMIS == 1) and player:hasKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND)) then
        local realDay = os.time();
        local dynaWaitxDay = player:getVar("dynaWaitxDay");
        local dynaUniqueID = GetServerVariable("[DynaValkurm]UniqueID");

        if (checkFirstDyna(player,7)) then
            player:startEvent(33);
        elseif (player:getMainLvl() < DYNA_LEVEL_MIN) then
            player:messageSpecial(ID.text.PLAYERS_HAVE_NOT_REACHED_LEVEL,DYNA_LEVEL_MIN);
        elseif ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) < realDay or (player:getVar("DynamisID") == dynaUniqueID and dynaUniqueID > 0)) then
            player:startEvent(16,7,0,0,BETWEEN_2DYNA_WAIT_TIME,32,dsp.ki.VIAL_OF_SHROUDED_SAND,4236,4237);
        else
            local dayRemaining = math.floor(((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) - realDay)/3456);
            player:messageSpecial(ID.text.YOU_CANNOT_ENTER_DYNAMIS,dayRemaining,7);
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

    if (csid == 33) then
        if (checkFirstDyna(player,7)) then
            player:setVar("Dynamis_Status",bit.bor(player:getVar("Dynamis_Status"),128));
        end
    elseif (csid == 16 and option == 0) then
        player:setVar("enteringDynamis",1);
        player:setPos(100,-8,131,47,39);
    end

end;