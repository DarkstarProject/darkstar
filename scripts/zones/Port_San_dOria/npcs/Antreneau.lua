-----------------------------------
--  Area: Port San d'Oria
--   NPC: Antreneau
--  Type: Standard NPC
-- @zone: 232
--  @pos -71 -5 -39
-- 
-- Involved in Quest: A Taste For Meat
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Port_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    player:startEvent(0x0214);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getQuestStatus(SANDORIA, A_TASTE_FOR_MEAT) == QUEST_COMPLETED and player:getVar("aTasteForMeat") == 1) then
        player:startEvent(0x0212); 
    elseif (player:getQuestStatus(SANDORIA, A_TASTE_FOR_MEAT) == QUEST_ACCEPTED) then
        if (player:hasItem(4358) == true) then
            player:startEvent(0x0213); 
        else
            player:startEvent(0x020d);
        end;
    elseif (player:getQuestStatus(SANDORIA, A_TASTE_FOR_MEAT) == QUEST_AVAILABLE and player:getVar("aTasteForMeat") == 0) then
        player:startEvent(0x020f);
    else    
        player:startEvent(0x0215);
    end;
    
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    
    if (csid == 0x020f) then
        player:setVar("aTasteForMeat", 1);
    elseif (csid == 0x0212) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED_2, 4371);
        else
            player:addItem(4371,1);
            player:messageSpecial(ITEM_OBTAINED,4371);
            player:setVar("aTasteForMeat", 0);
        end;
    end;
    
end;
