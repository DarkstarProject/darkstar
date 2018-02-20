-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Leuveret
-- General Info NPC
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria/TextIDs");
require("scripts/globals/quests");

function onTrade(player,npc,trade)
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1 and player:getVar("tradeLeuveret") == 0) then
            player:messageSpecial(LEUVERET_DIALOG);
            player:setVar("FFR",player:getVar("FFR") - 1);
            player:setVar("tradeLeuveret",1);
            player:messageSpecial(FLYER_ACCEPTED);
            player:tradeComplete();
        elseif (player:getVar("tradeLeuveret") == 1) then
            player:messageSpecial(FLYER_ALREADY);
        end
    end
end;

function onTrigger(player,npc)
    player:startEvent(621);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
