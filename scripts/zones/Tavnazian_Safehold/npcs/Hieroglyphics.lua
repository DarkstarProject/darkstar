-----------------------------------
-- Area: Tavnazian_Safehold
--  NPC: Hieroglyphics
-- Notes: Dynamis Tavnazia Enter
-- !pos 3.674 -7.278 -27.856 26
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/dynamis");
require("scripts/globals/missions");
local ID = require("scripts/zones/Tavnazian_Safehold/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if ((player:hasCompletedMission(COP,DARKNESS_NAMED) or FREE_COP_DYNAMIS == 1) and player:hasKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND) and
         player:hasKeyItem(dsp.ki.DYNAMIS_BUBURIMU_SLIVER) and player:hasKeyItem(dsp.ki.DYNAMIS_QUFIM_SLIVER) and player:hasKeyItem(dsp.ki.DYNAMIS_VALKURM_SLIVER)) then
        local realDay = os.time();
        local dynaWaitxDay = player:getVar("dynaWaitxDay");
        local dynaUniqueID = GetServerVariable("[DynaTavnazia]UniqueID");

        if (checkFirstDyna(player,10)) then
             player:startEvent(614);
        elseif (player:getMainLvl() < DYNA_LEVEL_MIN) then
            player:messageSpecial(ID.text.PLAYERS_HAVE_NOT_REACHED_LEVEL,DYNA_LEVEL_MIN);
        elseif ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) < realDay or (player:getVar("DynamisID") == dynaUniqueID and dynaUniqueID > 0)) then
            player:startEvent(588,10,0,0,BETWEEN_2DYNA_WAIT_TIME,32,dsp.ki.VIAL_OF_SHROUDED_SAND,4236,4237);
        else
            local dayRemaining = math.floor(((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) - realDay)/3456);
            player:messageSpecial(ID.text.YOU_CANNOT_ENTER_DYNAMIS,dayRemaining,10);
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

    if (csid == 614) then
        if (checkFirstDyna(player,10)) then
            player:setVar("Dynamis_Status",bit.bor(player:getVar("Dynamis_Status"),1024));
        end
    elseif (csid == 588 and option == 0) then
        player:setVar("enteringDynamis",1);
        player:setPos(0.1,-7,-21,190,42);
    end
end;