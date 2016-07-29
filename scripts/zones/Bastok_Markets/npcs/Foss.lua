-----------------------------------
-- Area: Bastok Markets
-- NPC: Foss
-- Starts & Finishes Repeatable Quest: Buckets of Gold
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

BucketsOfGold = player:getQuestStatus(BASTOK,BUCKETS_OF_GOLD);

    if (BucketsOfGold >= QUEST_ACCEPTED) then
        count = trade:getItemCount();
        RustyBucket = trade:hasItemQty(90,5);

        if (RustyBucket == true and count == 5) then
            player:startEvent(0x0110);
        end
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

BucketsOfGold = player:getQuestStatus(BASTOK,BUCKETS_OF_GOLD);

    if (BucketsOfGold == QUEST_AVAILABLE) then
        player:startEvent(0x010f);
    else
        player:startEvent(0x010e);
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x010f and option == 0) then
        player:addQuest(BASTOK,BUCKETS_OF_GOLD);            
    elseif (csid == 0x0110) then
        BucketsOfGold = player:getQuestStatus(BASTOK,BUCKETS_OF_GOLD);
        
        if (BucketsOfGold == QUEST_ACCEPTED) then
            player:completeQuest(BASTOK,BUCKETS_OF_GOLD);
            player:addFame(BASTOK,75);
            player:addTitle(BUCKET_FISHER);
        else
            player:addFame(BASTOK,8);
        end
        
        player:tradeComplete();
        player:addGil(GIL_RATE*300);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*300);
    end

end;




