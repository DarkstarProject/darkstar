-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Coullene
-- Type: Involved in Quest (Flyers for Regine)
-- !pos 146.420 0.000 127.601 231
--
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1 and player:getCharVar("tradeCoulene") == 0) then
            player:messageSpecial(ID.text.COULLENE_DIALOG);
            player:addCharVar("FFR", -1);
            player:setCharVar("tradeCoulene",1);
            player:messageSpecial(ID.text.FLYER_ACCEPTED);
            player:tradeComplete();
        elseif (player:getCharVar("tradeCoulene") ==1) then
            player:messageSpecial(ID.text.FLYER_ALREADY);
        end
    end
end;

function onTrigger(player,npc)
    player:showText(npc,ID.text.COULLENE_DIALOG);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
