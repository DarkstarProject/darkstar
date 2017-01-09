-----------------------------------
-- Area: Eastern Altepa Desert
-- NPC:  Lokpix
-- Starts Quest "Open Sesame"
-----------------------------------
package.loaded["scripts/zones/Eastern_Altepa_Desert/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Eastern_Altepa_Desert/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(OUTLANDS,OPEN_SESAME) == QUEST_ACCEPTED) then
        if ((trade:hasItemQty(2796,1) and trade:hasItemQty(582,1) and trade:getItemCount() == 2) or (trade:hasItemQty(2796,1) and trade:hasItemQty(3319,1) and trade:getItemCount() == 2)
         or (trade:hasItemQty(2796,1) and trade:hasItemQty(3300,12) and trade:getItemCount() == 13)) then
            player:startEvent(0x0016); 
        end
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getQuestStatus(OUTLANDS,OPEN_SESAME) == QUEST_AVAILABLE) then
        player:startEvent(0x0014); 
    elseif (player:getQuestStatus(OUTLANDS,OPEN_SESAME) == QUEST_ACCEPTED) then
        player:startEvent(0x0015); 
    elseif (player:hasCompleteQuest(OUTLANDS,OPEN_SESAME)) then
        player:startEvent(0x0018); 
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("OPTION: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("OPTION: %u",option);
    
    if (csid == 0x0014 and option == 1) then
        player:addQuest(OUTLANDS,OPEN_SESAME); 
    elseif (csid == 0x0016) then
        player:tradeComplete();
        player:addKeyItem(2051);
        player:messageSpecial(KEYITEM_OBTAINED,2051);
        player:addFame(RABAO,30);
        player:completeQuest(OUTLANDS,OPEN_SESAME);
    end
    
end;