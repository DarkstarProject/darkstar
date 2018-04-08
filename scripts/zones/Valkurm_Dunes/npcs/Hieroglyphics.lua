-----------------------------------
-- Area: Valkurm_Dunes
--  NPC: Hieroglyphics
-- Dynamis Valkurm_Dunes Enter
-- !pos 117 -10 133 103
-----------------------------------
package.loaded["scripts/zones/Valkurm_Dunes/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/dynamis");
require("scripts/globals/missions");
require("scripts/zones/Valkurm_Dunes/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if ((player:hasCompletedMission(COP,DARKNESS_NAMED) or FREE_COP_DYNAMIS == 1) and player:hasKeyItem(VIAL_OF_SHROUDED_SAND)) then
        local realDay = os.time();
        local dynaWaitxDay = player:getVar("dynaWaitxDay");
        local dynaUniqueID = GetServerVariable("[DynaValkurm]UniqueID");

        if (checkFirstDyna(player,7)) then
             player:startEvent(33);
        elseif (player:getMainLvl() < DYNA_LEVEL_MIN) then
            player:messageSpecial(PLAYERS_HAVE_NOT_REACHED_LEVEL,DYNA_LEVEL_MIN);
        elseif ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) < realDay or (player:getVar("DynamisID") == dynaUniqueID and dynaUniqueID > 0)) then
            player:startEvent(16,7,0,0,BETWEEN_2DYNA_WAIT_TIME,32,VIAL_OF_SHROUDED_SAND,4236,4237);
        else
            dayRemaining = math.floor(((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) - realDay)/3456);
            player:messageSpecial(YOU_CANNOT_ENTER_DYNAMIS,dayRemaining,7);
        end
    else
        player:messageSpecial(MYSTERIOUS_VOICE);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("updateRESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("finishRESULT: %u",option);

    if (csid == 33) then
        if (checkFirstDyna(player,7)) then
            player:setVar("Dynamis_Status",bit.bor(player:getVar("Dynamis_Status"),128));
        end
    elseif (csid == 16 and option == 0) then
        player:setVar("enteringDynamis",1);
        player:setPos(100,-8,131,47,0x27);
    end

end;