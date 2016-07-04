-----------------------------------
-- Area: Windurst Walls
-- NPC:  Trail Markings
-- Dynamis-Windurst Enter
-- @pos -216 0 -94 239
-----------------------------------
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/dynamis");
require("scripts/zones/Windurst_Walls/TextIDs");

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
        player:startEvent(0x01c7); -- cs with Cornelia
    elseif (player:getVar("DynaWindurst_Win") == 1) then
        player:startEvent(0x01d1,HYDRA_CORPS_LANTERN); -- Win CS
    elseif (player:hasKeyItem(VIAL_OF_SHROUDED_SAND)) then
        local firstDyna = 0;
        local realDay = os.time();
        local dynaWaitxDay = player:getVar("dynaWaitxDay");
        
        if (checkFirstDyna(player,3)) then  -- First Dyna-Windurst => CS
            firstDyna = 1; 
        end
        
        if (player:getMainLvl() < DYNA_LEVEL_MIN) then
            player:messageSpecial(PLAYERS_HAVE_NOT_REACHED_LEVEL,DYNA_LEVEL_MIN);
        elseif ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 24 * 60 * 60)) < realDay or player:getVar("DynamisID") == GetServerVariable("[DynaWindurst]UniqueID")) then
            player:startEvent(0x01c4,3,firstDyna,0,BETWEEN_2DYNA_WAIT_TIME,64,VIAL_OF_SHROUDED_SAND,4236,4237);
        else
            dayRemaining = math.floor(((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 24 * 60 * 60)) - realDay)/3456);
            player:messageSpecial(YOU_CANNOT_ENTER_DYNAMIS,dayRemaining,3);
        end
    else
        player:messageSpecial(STRANDS_OF_GRASS_HERE);
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
-- printf("finishRESULT: %u",option);
    
    if (csid == 0x01c7) then
        player:addKeyItem(VIAL_OF_SHROUDED_SAND);
        player:messageSpecial(KEYITEM_OBTAINED,VIAL_OF_SHROUDED_SAND);
        player:setVar("Dynamis_Status",0);
    elseif (csid == 0x01d1) then
        player:setVar("DynaWindurst_Win",0);
    elseif (csid == 0x01c4 and option == 0) then
        if (checkFirstDyna(player,3)) then
            player:setVar("Dynamis_Status",player:getVar("Dynamis_Status") + 8);
        end
        
        player:setPos(-221.988,1.000,-120.184,0,0xbb);
    end
    
end;