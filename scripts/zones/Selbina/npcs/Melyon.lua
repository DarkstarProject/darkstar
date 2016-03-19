-----------------------------------
-- Area: Selbina
-- NPC:  Melyon
-- Starts and Finishes Quest: Only the Best (R)
-- Involved in Quest: Riding on the Clouds
-- @pos 25 -6 6 248
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Selbina/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (player:getQuestStatus(OTHER_AREAS,ONLY_THE_BEST) ~= QUEST_AVAILABLE) then
        if (trade:hasItemQty(4366,5) == true and trade:getGil() == 0 and trade:getItemCount() == 5) then 
            player:startEvent(0x003e); -- La Theine Cabbage x5
            
        elseif (trade:hasItemQty(629,3) == true and trade:getGil() == 0 and trade:getItemCount() == 3) then 
            player:startEvent(0x003f); -- Millioncorn x3
            
        elseif (trade:hasItemQty(919,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
            player:startEvent(0x0040); -- Boyahda Moss x1 
            
        end
    end
    
    if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_3") == 3) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_3",0);
            player:tradeComplete();
            player:addKeyItem(SOMBER_STONE);
            player:messageSpecial(KEYITEM_OBTAINED,SOMBER_STONE);
        end
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    OnlyTheBest = player:getQuestStatus(OTHER_AREAS,ONLY_THE_BEST);
    
    if (OnlyTheBest == QUEST_AVAILABLE) then
        player:startEvent(0x003c,4366,629,919); -- Start quest "Only the Best"
    elseif (OnlyTheBest ~= QUEST_AVAILABLE) then
        player:startEvent(0x003d,4366,629,919); -- During & after completed quest "Only the Best"
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
    
    if (csid == 0x003c and option == 10) then
        player:addQuest(OTHER_AREAS,ONLY_THE_BEST);
    elseif (csid == 0x003e) then
        player:tradeComplete();
        player:addGil(100);
        player:messageSpecial(GIL_OBTAINED,100);
        player:addFame(BASTOK, 10);
        player:addFame(SANDORIA, 10);
        player:addFame(JEUNO, 10);
        player:completeQuest(OTHER_AREAS,ONLY_THE_BEST);
    elseif (csid == 0x003f) then
        player:tradeComplete();
        player:addGil(120);
        player:messageSpecial(GIL_OBTAINED,120);
        player:addFame(BASTOK, 20);
        player:addFame(SANDORIA, 20);
        player:addFame(JEUNO, 20);
        player:completeQuest(OTHER_AREAS,ONLY_THE_BEST);
    elseif (csid == 0x0040) then
        player:tradeComplete();
        player:addGil(600);
        player:messageSpecial(GIL_OBTAINED,600);
        player:addFame(BASTOK, 30);
        player:addFame(SANDORIA, 30);
        player:addFame(JEUNO, 30);
        player:completeQuest(OTHER_AREAS,ONLY_THE_BEST);
    end
    
end;