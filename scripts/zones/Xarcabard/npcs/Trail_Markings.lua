-----------------------------------
-- Area: Xarcabard
--  NPC: Trail Markings
-- Dynamis-Xarcabard Enter
-- !pos 570 0 -272 112
-----------------------------------
package.loaded["scripts/zones/Xarcabard/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/dynamis");
require("scripts/zones/Xarcabard/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getVar("DynaXarcabard_Win") == 1) then
        player:startEvent(32,dsp.ki.HYDRA_CORPS_BATTLE_STANDARD); -- Win CS
    elseif (player:hasKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND) and player:hasKeyItem(dsp.ki.HYDRA_CORPS_INSIGNIA)) then
        local firstDyna = 0;
        local realDay = os.time();
        local dynaWaitxDay = player:getVar("dynaWaitxDay");
        local dynaUniqueID = GetServerVariable("[DynaXarcabard]UniqueID");

        if (checkFirstDyna(player,6)) then  -- First Dyna-Xarcabard => CS
            firstDyna = 1;
        end

        if (player:getMainLvl() < DYNA_LEVEL_MIN) then
            player:messageSpecial(PLAYERS_HAVE_NOT_REACHED_LEVEL,DYNA_LEVEL_MIN);
        elseif ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) < realDay or (player:getVar("DynamisID") == dynaUniqueID and dynaUniqueID > 0)) then
            player:startEvent(16,6,firstDyna,0,BETWEEN_2DYNA_WAIT_TIME,32,dsp.ki.VIAL_OF_SHROUDED_SAND,4236,4237);
        else
            dayRemaining = math.floor(((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) - realDay)/3456);
            player:messageSpecial(YOU_CANNOT_ENTER_DYNAMIS,dayRemaining,6);
        end
    else
        player:messageSpecial(UNUSUAL_ARRANGEMENT_OF_PEBBLES);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("updateRESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("finishRESULT: %u",option);

    if (csid == 32) then
        player:setVar("DynaXarcabard_Win",0);
    elseif (csid == 16 and option == 0) then
        if (checkFirstDyna(player,6)) then
            player:setVar("Dynamis_Status",bit.bor(player:getVar("Dynamis_Status"),64));
        end
        player:setVar("enteringDynamis",1);
        player:setPos(569.312,-0.098,-270.158,90,0x87);
    end
end;