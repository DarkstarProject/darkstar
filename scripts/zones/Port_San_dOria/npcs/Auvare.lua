-----------------------------------
-- Area: Port San d'Oria
--  NPC: Auvare
-- Standard Info NPC
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1 and player:getVar("tradeAuvare") == 0) then
            player:messageSpecial(ID.text.AUVARE_DIALOG);
            player:addVar("FFR", -1)
            player:setVar("tradeAuvare",1);
            player:messageSpecial(ID.text.FLYER_ACCEPTED);
            player:messageSpecial(ID.text.FLYERS_HANDED,17 - player:getVar("FFR"));
            player:tradeComplete();
        elseif (player:getVar("tradeAuvare") ==1) then
            player:messageSpecial(ID.text.FLYER_ALREADY);
        end
    end
end;

function onTrigger(player,npc)
    player:startEvent(598);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
