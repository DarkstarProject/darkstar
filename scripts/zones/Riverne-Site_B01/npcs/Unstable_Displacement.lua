-----------------------------------
-- Area: Riverne Site #B01
-- NPC:  Unstable Displacement
-- ENM Battlefield
-- @pos -612 4 693
-----------------------------------
package.loaded["scripts/zones/Riverne-Site_B01/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Riverne-Site_B01/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/status");
require("scripts/globals/bcnm");

    -- events:
    -- 7D00 : BC menu
    -- Param 4 is a bitmask for the choice of battlefields in the menu:
    
    -- 0: 
    -- 1: 
    -- 2: 
    -- 3: 
    -- 4: 
    -- 5: 

    -- Param 8 is a flag: 0 : menu, >0 : automatically enter and exit
  
    -- 7D01 : final BC event.
    -- param 2: #time record for this mission
    -- param 3: #clear time in seconds
    -- param 6: #which mission (linear numbering as above)
    -- 7D03 : stay/run away
    
-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
    if (TradeBCNM(player,player:getZoneID(),trade,npc)) then
        return;
    end
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    if (player:getQuestStatus(JEUNO,STORMS_OF_FATE) == QUEST_ACCEPTED and player:getVar('StormsOfFate') == 1) then
        player:startEvent(0x0001);
    elseif (EventTriggerBCNM(player,npc)) then
        return 1;
    else
        player:messageSpecial(SPACE_SEEMS_DISTORTED);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    
    if (EventUpdateBCNM(player,csid,option)) then
        return;
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0001) then
        player:setVar('StormsOfFate',2);
    elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end
end;