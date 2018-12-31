-----------------------------------
-- Area: Port San d'Oria
--  NPC: Answald
-- Standard Info NPC
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs");
require("scripts/globals/quests");


function onTrade(player,npc,trade)
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1 and player:getVar("tradeAnswald") == 0) then
            player:messageSpecial(ID.text.ANSWALD_DIALOG);
            player:messageSpecial(ID.text.FLYER_ACCEPTED);
            player:tradeComplete();
            player:setVar("FFR",player:getVar("FFR") - 1);
            player:setVar("tradeAnswald",1);
            player:messageSpecial(ID.text.FLYERS_HANDED, 17 - player:getVar("FFR"));
        elseif (player:getVar("tradeAnswald") ==1) then
            player:messageSpecial(ID.text.FLYER_ALREADY);
        end
    end
end;

function onTrigger(player,npc)
    player:startEvent(584);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
