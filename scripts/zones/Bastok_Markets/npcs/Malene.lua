-----------------------------------
-- Area: Bastok Markets
--  NPC: Malene
-- Type: Quest NPC
-- !pos -173 -5 64 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/npc_util");
require("scripts/globals/quests");
require("scripts/globals/titles");

function onTrade(player,npc,trade)
    if (player:getQuestStatus(BASTOK, THE_COLD_LIGHT_OF_DAY) >= QUEST_AVAILABLE and npcUtil.tradeHas(trade, 550)) then
        player:startEvent(104);
    end
end;

function onTrigger(player,npc)
    if (player:getQuestStatus(BASTOK, WISH_UPON_A_STAR) == QUEST_ACCEPTED and player:getVar("WishUponAStar_Status") == 1) then -- Quest: Wish Upon a Star
        player:startEvent(330);
    else -- Quest: The Cold Light of Day
        player:startEvent(102);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    -- THE COLD LIGHT OF DAY
    if (csid == 102) then
        if (player:getQuestStatus(BASTOK, THE_COLD_LIGHT_OF_DAY) == QUEST_AVAILABLE) then
            player:addQuest(BASTOK, THE_COLD_LIGHT_OF_DAY);
        end
    elseif (csid == 104) then
        local fame = player:hasCompleteQuest(BASTOK, THE_COLD_LIGHT_OF_DAY) and 8 or 50;
        if (npcUtil.completeQuest(player, BASTOK, THE_COLD_LIGHT_OF_DAY, {title=CRAB_CRUSHER, gil=500, fame=fame})) then
            player:confirmTrade();
        end
        
    -- WISH UPON A STAR
    elseif (csid == 330) then
        player:setVar("WishUponAStar_Status", 2);
    end
end;
