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
    if ((player:hasCompletedMission(COP,DARKNESS_NAMED) or FREE_COP_DYNAMIS == 1) and player:hasKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND)) then
        local realDay = os.time();
        local dynaWaitxDay = player:getVar("dynaWaitxDay");
        local dynaUniqueID = GetServerVariable("[DynaValkurm]UniqueID");

        if (checkFirstDyna(player,7)) then
            player:startEvent(58,7,0x010002,0x060E,1,0x195,dsp.ki.VIAL_OF_SHROUDED_SAND,4236,4237);
        elseif (player:getMainLvl() < DYNA_LEVEL_MIN) then
            player:messageSpecial(PLAYERS_HAVE_NOT_REACHED_LEVEL,DYNA_LEVEL_MIN);
        elseif ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) < realDay or (player:getVar("DynamisID") == dynaUniqueID and dynaUniqueID > 0)) then
            player:startEvent(58,7,0x010003,0x060E,1,0xFFFF5DC2,dsp.ki.VIAL_OF_SHROUDED_SAND,4236,4237);
        else
            dayRemaining = math.floor(((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) - realDay)/3456);
            player:messageSpecial(YOU_CANNOT_ENTER_DYNAMIS,dayRemaining,7);
        end
    else
        player:messageSpecial(MYSTERIOUS_VOICE);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("updateRESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("finishRESULT: %u",option);
     print(option)

    if csid == 58 then
        if (checkFirstDyna(player,7)) then
            player:setVar("Dynamis_Status",bit.bor(player:getVar("Dynamis_Status"),128));
        end
        if option == 0 or option == 1 then
            if option == 1 then
                player:setVar("Dynamis_subjob", 1)
            else
                player:setVar("Dynamis_subjob", 0)
            end
            player:setVar("Dynamis_Entry", 1)
            local realDay = os.time();
            if (DYNA_MIDNIGHT_RESET == true) then
                realDay = getMidnight() - 86400;
            end
            local dynaWaitxDay = player:getVar("dynaWaitxDay");

            if ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) < realDay) then
                player:setVar("dynaWaitxDay",realDay);
            end
            player:setPos(100,-8,131,47,0x27);
        end
    end
end;
