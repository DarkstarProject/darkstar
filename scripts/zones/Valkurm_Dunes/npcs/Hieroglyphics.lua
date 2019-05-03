-----------------------------------
-- Area: Valkurm_Dunes
--  NPC: Hieroglyphics
-- Dynamis Valkurm_Dunes Enter
-- !pos 117 -10 133 103
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/settings")
require("scripts/globals/dynamis")
local ID = require("scripts/zones/Valkurm_Dunes/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if player:getVar("DynaValkurm_Win") == 1 then
        player:startEvent(39)
    elseif (player:hasCompletedMission(COP,dsp.mission.id.cop.DARKNESS_NAMED) or FREE_COP_DYNAMIS == 0) and player:hasKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND) then
        local realDay = os.time()
        local dynaWaitxDay = player:getVar("dynaWaitxDay")

        if player:getMainLvl() < DYNA_LEVEL_MIN then
            player:messageSpecial(ID.text.PLAYERS_HAVE_NOT_REACHED_LEVEL,DYNA_LEVEL_MIN);
        elseif (dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) < realDay then
--          Params: DynamisCity, CS option, KI, Support Job Option, junk, KI, Timeless Hrgls, Perpetual Hrgls
            player:startEvent(58,7,checkFirstDyna(player,7),dsp.ki.PRISMATIC_HOURGLASS,1,0,dsp.ki.VIAL_OF_SHROUDED_SAND,4236,4237)
        else
            dayRemaining = math.floor(((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) - realDay)/3456)
            player:messageSpecial(ID.text.YOU_CANNOT_ENTER_DYNAMIS,dayRemaining,7);
        end
    else
        player:messageSpecial(ID.text.MYSTERIOUS_VOICE);
    end
end

function onEventUpdate(player,csid,option)
    -- printf("updateRESULT: %u",option)
end

function onEventFinish(player,csid,option)
    -- printf("finishRESULT: %u",option)
     print(option)

    if csid == 39 then
        player:setVar("DynaValkurm_Win", 0)
    elseif csid == 58 then
        if checkFirstDyna(player,7) ~= 3 and checkFirstDyna(player,7) ~= 65539 then
            player:setVar("Dynamis_Status",bit.bor(player:getVar("Dynamis_Status"),128))
        end
        if option == 0 or option == 1 then
            player:setVar("Dynamis_subjob", option)
            player:setVar("Dynamis_Entry", 1)
            local realDay = os.time()
            if (DYNA_MIDNIGHT_RESET == true) then
                realDay = getMidnight() - 86400
            end
            local dynaWaitxDay = player:getVar("dynaWaitxDay")

            if (dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) < realDay
                and not player:hasKeyItem(dsp.ki.RHAPSODY_IN_AZURE) then
                    player:setVar("dynaWaitxDay",realDay)
            end
            player:setPos(100,-8,131,47,0x27)
        end
    end
end
