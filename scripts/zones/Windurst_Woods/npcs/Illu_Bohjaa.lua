-----------------------------------
-- Area: Windurst Woods
--  NPC: Illu Bohjaa
-- Involved in the repeatable quest "Creepy Crawlies"
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(WINDURST,CREEPY_CRAWLIES) ~= QUEST_AVAILABLE) then
        local count = trade:getItemCount();
        local SilkThread = trade:hasItemQty(816, 3);
        local CrawlerCalculus = trade:hasItemQty(1156, 3);

        if ((SilkThread or CrawlerCalculus) and count == 3) then
            if (SilkThread == true) then
                player:addFame(WINDURST, 15);
            elseif (CrawlerCalculus == true) then
                player:addFame(WINDURST, 30);
            end
            player:startEvent(335, 600 * GIL_RATE, 816, 938, 1156);
        end
    end
end;

function onTrigger(player,npc)
    if (player:getQuestStatus(WINDURST, CREEPY_CRAWLIES) == QUEST_AVAILABLE) then
        player:startEvent(333,0,816,938,1156);
    else
        player:startEvent(334,0,816,938,1156);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 333 and option == 1) then
        player:addQuest(WINDURST, CREEPY_CRAWLIES);
    elseif (csid == 335) then
        player:tradeComplete();
        player:addGil(600 * GIL_RATE);
        player:completeQuest(WINDURST,CREEPY_CRAWLIES);
        player:addTitle(CRAWLER_CULLER);
    end
end;
