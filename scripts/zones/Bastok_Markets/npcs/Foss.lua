-----------------------------------
-- Area: Bastok Markets
-- NPC: Foss
-- Starts & Finishes Repeatable Quest: Buckets of Gold
-- !pos -283 -12 -37 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/npc_util");
require("scripts/globals/quests");
require("scripts/globals/titles");

function onTrade(player,npc,trade)
    if (player:getQuestStatus(BASTOK,BUCKETS_OF_GOLD) >= QUEST_ACCEPTED and npcUtil.tradeHas(trade, {{90,5}})) then
        player:startEvent(272);
    end
end; 

function onTrigger(player,npc)
    if (player:getQuestStatus(BASTOK,BUCKETS_OF_GOLD) == QUEST_AVAILABLE) then
        player:startEvent(271);
    else
        player:startEvent(270);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 271 and option == 0) then
        player:addQuest(BASTOK,BUCKETS_OF_GOLD);            
    elseif (csid == 272) then
        local fame = player:hasCompleteQuest(BASTOK, BUCKETS_OF_GOLD) and 8 or 75;
        if (npcUtil.completeQuest(player, BASTOK, BUCKETS_OF_GOLD, {title=BUCKET_FISHER, gil=300, fame=fame})) then
            player:confirmTrade();
        end
    end
end;
