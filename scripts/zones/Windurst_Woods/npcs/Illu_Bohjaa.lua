-----------------------------------
-- Area: Windurst Woods
--  NPC: Illu Bohjaa
-- Starts the repeatable quest "Creepy Crawlies"
-- Working 100%
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/zones/Windurst_Woods/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

CrepyCrawlies = player:getQuestStatus(WINDURST,CREEPY_CRAWLIES);

    if (CrepyCrawlies ~= QUEST_AVAILABLE) then
        count = trade:getItemCount();
        SilkThread = trade:hasItemQty(816,3);
        CrawlerCalculus = trade:hasItemQty(1156,3);

        if ((SilkThread == true or CrawlerCalculus == true) and count == 3) then
            if (SilkThread == true) then
                player:addFame(WINDURST,15);
            elseif (CrawlerCalculus == true) then
                player:addFame(WINDURST,30);
            end

            player:tradeComplete();
            player:addGil(GIL_RATE*600);
            player:completeQuest(WINDURST,CREEPY_CRAWLIES);
            player:addTitle(CRAWLER_CULLER);

            player:startEvent(335,GIL_RATE*600,816,938,1156);
        end
    end
end;

function onTrigger(player,npc)

CrepyCrawlies = player:getQuestStatus(WINDURST,CREEPY_CRAWLIES);

    if (CrepyCrawlies == QUEST_AVAILABLE) then
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
        player:addQuest(WINDURST,CREEPY_CRAWLIES);
    end
end;




