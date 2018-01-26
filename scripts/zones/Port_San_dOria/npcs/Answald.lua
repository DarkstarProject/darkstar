-----------------------------------
-- Area: Port San d'Oria
--  NPC: Answald
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
require("scripts/globals/quests");


function onTrade(player,npc,trade)
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1 and player:getVar("tradeAnswald") == 0) then
            player:messageSpecial(ANSWALD_DIALOG);
            player:messageSpecial(FLYER_ACCEPTED);
            player:tradeComplete();
            player:setVar("FFR",player:getVar("FFR") - 1);
            player:setVar("tradeAnswald",1);
            player:messageSpecial(FLYERS_HANDED, 17 - player:getVar("FFR"));
        elseif (player:getVar("tradeAnswald") ==1) then
            player:messageSpecial(FLYER_ALREADY);
        end
    end
end;

function onTrigger(player,npc)
    player:startEvent(584);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

