-----------------------------------
--  Area: Port San d'Oria
--   NPC: Antreneau
--  Type: Standard NPC
-- !pos -71 -5 -39 232
-- Involved in Quest: A Taste For Meat
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_San_dOria/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    player:startEvent(532);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getQuestStatus(SANDORIA, A_TASTE_FOR_MEAT) == QUEST_COMPLETED and player:getVar("aTasteForMeat") == 1) then
        player:startEvent(530);
    elseif (player:getQuestStatus(SANDORIA, A_TASTE_FOR_MEAT) == QUEST_ACCEPTED) then
        if (player:hasItem(4358) == true) then
            player:startEvent(531);
        else
            player:startEvent(525);
        end;
    elseif (player:getQuestStatus(SANDORIA, A_TASTE_FOR_MEAT) == QUEST_AVAILABLE and player:getVar("aTasteForMeat") == 0) then
        player:startEvent(527);
    else
        player:startEvent(533);
    end;
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 527) then
        player:setVar("aTasteForMeat", 1);
    elseif (csid == 530) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 4371);
        else
            player:addItem(4371,1);
            player:messageSpecial(ITEM_OBTAINED,4371);
            player:setVar("aTasteForMeat", 0);
        end;
    end;
end;
