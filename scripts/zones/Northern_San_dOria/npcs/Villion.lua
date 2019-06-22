-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Villion
-- Type: Adventurer's Assistant NPC
--  Involved in Quest: Flyers for Regine
-- !pos -157.524 4.000 263.818 231
--
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1 and player:getVar("tradeVilion") == 0) then
            player:messageSpecial(ID.text.VILLION_DIALOG);
            player:addVar("FFR", -1);
            player:setVar("tradeVilion",1);
            player:messageSpecial(ID.text.FLYER_ACCEPTED);
            player:tradeComplete();
        elseif (player:getVar("tradeVilion") ==1) then
            player:messageSpecial(ID.text.FLYER_ALREADY);
        end
    end
end;

function onTrigger(player,npc)
    player:startEvent(632);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
