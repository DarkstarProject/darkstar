-----------------------------------
-- Area: La Theine Plateau
-- NPC:  Deaufrain
-- Involved in Mission: The Rescue Drill
-- @pos -304 28 339 102
-----------------------------------
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/La_Theine_Plateau/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getCurrentMission(SANDORIA) == THE_RESCUE_DRILL) then
        local MissionStatus = player:getVar("MissionStatus");
        
        if (MissionStatus == 3) then
            player:startEvent(0x0066);
        elseif (MissionStatus == 4) then
            player:showText(npc, RESCUE_DRILL + 4);
        elseif (MissionStatus == 8) then
            if (player:getVar("theRescueDrillRandomNPC") == 3) then
                player:startEvent(0x0071); 
            else
                player:showText(npc, RESCUE_DRILL + 21);
            end
        elseif (MissionStatus == 9) then
            if (player:getVar("theRescueDrillRandomNPC") == 3) then
                player:showText(npc, RESCUE_DRILL + 25);
            else
                player:showText(npc, RESCUE_DRILL + 26);
            end
        elseif (MissionStatus >= 10) then
            player:showText(npc, RESCUE_DRILL + 30);
        else
            player:showText(npc, RESCUE_DRILL);
        end
    else
        player:showText(npc, RESCUE_DRILL);
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    
    if (csid == 0x0066) then
        player:setVar("MissionStatus",4);
    elseif (csid == 0x0071) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16535); -- Bronze Sword
        else
            player:addItem(16535);
            player:messageSpecial(ITEM_OBTAINED, 16535); -- Bronze Sword
            player:setVar("MissionStatus",9);
        end
    end
    
end;