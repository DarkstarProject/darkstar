-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC:  Ahkk Jharcham
-- Quest 'Keeping Notes'
-- @pos 0.1 -1 -76 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    local keepingNotes = player:getQuestStatus(AHT_URHGAN,KEEPING_NOTES);
    local sheetOfParchment = trade:hasItemQty(917,1);
    local jarOfBlackInk = trade:hasItemQty(929,1);
    
    if (keepingNotes == QUEST_ACCEPTED and sheetOfParchment and jarOfBlackInk and trade:getItemCount() == 2) then
        player:startEvent(0x000B);
    elseif (keepingNotes == QUEST_COMPLETED and sheetOfParchment and trade:getItemCount() == 1) then
        player:startEvent(0x000D);
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    local keepingNotes = player:getQuestStatus(AHT_URHGAN,KEEPING_NOTES);
    
    if (keepingNotes == QUEST_AVAILABLE) then
        player:startEvent(0x0009);
    elseif (keepingNotes == QUEST_ACCEPTED) then
        player:startEvent(0x000E);
    elseif (keepingNotes == QUEST_COMPLETED) then
        player:startEvent(0x000C);
    else
        player:startEvent(0x000a);
    end
    
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
    
    if (csid == 0x0009) then
        player:addQuest(AHT_URHGAN,KEEPING_NOTES);
    elseif (csid == 0x000B) then
        player:moghouseFlag(16);
        player:completeQuest(AHT_URHGAN,KEEPING_NOTES);
    end
    
end;