-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Narcheral
-- Starts and Finishes Quest: Messenger from Beyond, Prelude of Black and White (Finish), Pieuje's Decision (Finish)
-- @zone 231
-- @pos 129 -11 126
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(SANDORIA, MESSENGER_FROM_BEYOND) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(1096,1) and trade:getItemCount() == 1) then -- Trade Tavnazia Pass
            player:startEvent(0x02b2); -- Finish quest "Messenger from Beyond"
        end
    elseif (player:getQuestStatus(SANDORIA,PRELUDE_OF_BLACK_AND_WHITE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(1097,1) and trade:hasItemQty(12995,1) and trade:getItemCount() == 2) then -- Trade Yagudo Holy Water & Moccasins
            player:startEvent(0x02b3); -- Finish quest "Prelude of Black and White"
        end
    elseif (player:getQuestStatus(SANDORIA,PIEUJE_S_DECISION) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(13842,1) and trade:getItemCount() == 1) then -- Trade Tavnazian Mask
            player:startEvent(0x02b4); -- Finish quest "Pieuje's Decision"
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    messengerFromBeyond = player:getQuestStatus(SANDORIA,MESSENGER_FROM_BEYOND);
    
    -- Checking levels and jobs for af quest
    mLvl = player:getMainLvl();
    mJob = player:getMainJob();
    
    if (messengerFromBeyond == QUEST_AVAILABLE and mJob == 3 and mLvl >= AF1_QUEST_LEVEL) then
        player:startEvent(0x02b1); -- Start quest "Messenger from Beyond"
    else
        player:startEvent(0x02b0); -- Standard dialog
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
    
    if (csid == 0x02b1) then
        player:addQuest(SANDORIA,MESSENGER_FROM_BEYOND);
    elseif (csid == 0x02b2) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17422);
        else
            player:addItem(17422);
            player:messageSpecial(ITEM_OBTAINED,17422); -- Blessed Hammer
            player:tradeComplete();
            player:addFame(SANDORIA,AF1_FAME);
            player:completeQuest(SANDORIA,MESSENGER_FROM_BEYOND);
        end
    elseif (csid == 0x02b3) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14091); -- Healer's Duckbills
        else
            player:addItem(14091);
            player:messageSpecial(ITEM_OBTAINED,14091); -- Healer's Duckbills
            player:tradeComplete();
            player:addFame(SANDORIA,AF2_FAME);
            player:completeQuest(SANDORIA,PRELUDE_OF_BLACK_AND_WHITE);
        end
    elseif (csid == 0x02b4) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12640); -- Healer's Briault
        else
            player:addTitle(PARAGON_OF_WHITE_MAGE_EXCELLENCE);
            player:setVar("pieujesDecisionCS",0);
            player:addItem(12640);
            player:messageSpecial(ITEM_OBTAINED,12640); -- Healer's Briault
            player:tradeComplete();
            player:addFame(SANDORIA,AF3_FAME);
            player:completeQuest(SANDORIA,PIEUJE_S_DECISION);
        end
    end
    
end;