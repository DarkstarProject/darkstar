-----------------------------------
-- Area: Xarcabard
-- NPC:  Trail Markings
-- Dynamis-Xarcabard Enter
-- @pos 570 0 -272 112
-----------------------------------
package.loaded["scripts/zones/Xarcabard/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/dynamis");
require("scripts/zones/Xarcabard/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getVar("DynaXarcabard_Win") == 1) then
        player:startEvent(0x0020,HYDRA_CORPS_BATTLE_STANDARD); -- Win CS
    elseif (player:hasKeyItem(HYDRA_CORPS_INSIGNIA)) then
        local firstDyna = 0;
        local realDay = os.time();
        local dynaWaitxDay = player:getVar("dynaWaitxDay");
        
        if (checkFirstDyna(player,6)) then  -- First Dyna-Xarcabard => CS
            firstDyna = 1;
        end
        
        if (player:getMainLvl() < DYNA_LEVEL_MIN) then
            player:messageSpecial(PLAYERS_HAVE_NOT_REACHED_LEVEL,DYNA_LEVEL_MIN);
        elseif dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 24 * 60 * 60) < realDay then
            player:startEvent(0x0010,6,firstDyna,0,BETWEEN_2DYNA_WAIT_TIME,32,VIAL_OF_SHROUDED_SAND,4236,4237);
        else
            dayRemaining = math.floor(((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 24 * 60 * 60)) - realDay)/3456);
            player:messageSpecial(YOU_CANNOT_ENTER_DYNAMIS,dayRemaining,6);
        end
    else
        player:messageSpecial(UNUSUAL_ARRANGEMENT_OF_PEBBLES);
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("updateRESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("finishRESULT: %u",option);

    if (csid == 0x0020) then
        player:setVar("DynaXarcabard_Win",0);
    elseif (csid == 0x0010 and option == 0) then
        if (checkFirstDyna(player,6)) then
            player:setVar("Dynamis_Status",bit.bor(player:getVar("Dynamis_Status"),64));
        end
        player:setVar("enteringDynamis",1);
        player:setPos(569.312,-0.098,-270.158,90,0x87);
    end
end;