-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Villion
-- Type: Adventurer's Assistant NPC
--  Involved in Quest: Flyers for Regine
--  @zone 231
-- !pos -157.524 4.000 263.818
--
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1 and player:getVar("tradeVilion") == 0) then
            player:messageSpecial(VILLION_DIALOG);
            player:setVar("FFR",player:getVar("FFR") - 1);
            player:setVar("tradeVilion",1);
            player:messageSpecial(FLYER_ACCEPTED);
            player:tradeComplete();
        elseif (player:getVar("tradeVilion") ==1) then
            player:messageSpecial(FLYER_ALREADY);
        end
    end
end;

function onTrigger(player,npc)
    player:startEvent(632);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
