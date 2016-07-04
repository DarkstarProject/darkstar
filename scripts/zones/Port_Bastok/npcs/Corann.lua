-----------------------------------
-- Area: Port Bastok
-- NPC: Corann
-- Start & Finishes Quest: The Quadav's Curse
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

TheQuadav = player:getQuestStatus(BASTOK,THE_QUADAV_S_CURSE);
    
    if (TheQuadav == QUEST_ACCEPTED) then
        count = trade:getItemCount();
        QuadavBack = trade:hasItemQty(596,1);

        if (count == 1 and QuadavBack == true) then
            player:startEvent(0x0051);
        end
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

TheQuadav = player:getQuestStatus(BASTOK,THE_QUADAV_S_CURSE);
OutOfOneShell = player:getQuestStatus(BASTOK,OUT_OF_ONE_S_SHELL);

    if (OutOfOneShell == QUEST_COMPLETED) then
        player:startEvent(0x0058);
    elseif (TheQuadav == QUEST_COMPLETED) then
        player:startEvent(0x0057);
    elseif (TheQuadav == QUEST_AVAILABLE) then
        player:startEvent(0x0050);
    else
        player:startEvent(0x0026);
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
    
    if (csid == 0x0050) then
        player:addQuest(BASTOK,THE_QUADAV_S_CURSE);
    elseif (csid == 0x0051) then
        player:tradeComplete();
        player:completeQuest(BASTOK,THE_QUADAV_S_CURSE);
        player:addFame(BASTOK,120);
        player:addItem(12832);
        player:messageSpecial(ITEM_OBTAINED,12832);
    end

end;




