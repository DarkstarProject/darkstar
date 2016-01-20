-----------------------------------
-- Area: Bastok Mines
-- NPC:  Trail Markings
-- Dynamis-Bastok Enter
-- @pos 99 1 -67 234
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/dynamis");
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getVar("Dynamis_Status") == 1) then
        player:startEvent(0x00CB); -- cs with Cornelia
    elseif (player:getVar("DynaBastok_Win") == 1) then
        player:startEvent(0x00d7,HYDRA_CORPS_EYEGLASS); -- Win CS
    elseif (player:hasKeyItem(VIAL_OF_SHROUDED_SAND)) then
        local firstDyna = 0;
        local realDay = os.time();
        local dynaWaitxDay = player:getVar("dynaWaitxDay");
        
        if (checkFirstDyna(player,2)) then  -- First Dyna-Bastok => CS
            firstDyna = 1; 
        end
        
        if (player:getMainLvl() < DYNA_LEVEL_MIN) then
            player:messageSpecial(PLAYERS_HAVE_NOT_REACHED_LEVEL,DYNA_LEVEL_MIN);
        elseif ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 24 * 60 * 60)) < realDay or player:getVar("DynamisID") == GetServerVariable("[DynaBastok]UniqueID")) then
            player:startEvent(0x00c9,2,firstDyna,0,BETWEEN_2DYNA_WAIT_TIME,64,VIAL_OF_SHROUDED_SAND,4236,4237);
        else
            dayRemaining = math.floor(((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 24 * 60 * 60)) - realDay)/3456);
            player:messageSpecial(YOU_CANNOT_ENTER_DYNAMIS,dayRemaining,2);
        end
    else
        player:messageSpecial(UNUSUAL_ARRANGEMENT_PEBBLES);
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("updateRESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("finishRESULT: %u",option);
    
    if (csid == 0x00CB) then
        player:addKeyItem(VIAL_OF_SHROUDED_SAND);
        player:messageSpecial(KEYITEM_OBTAINED,VIAL_OF_SHROUDED_SAND);
        player:setVar("Dynamis_Status",0);
    elseif (csid == 0x00d7) then
        player:setVar("DynaBastok_Win",0);
    elseif (csid == 0x00c9 and option == 0) then
        if (checkFirstDyna(player,2)) then
            player:setVar("Dynamis_Status",player:getVar("Dynamis_Status") + 4);
        end
        
        player:setPos(116.482,0.994,-72.121,128,0xba);
    end
    
end;