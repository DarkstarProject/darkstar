-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Adaunel
-- General Info NPC
-- !pos 80 -7 -22 230
------------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1 and player:getCharVar("tradeAdaunel") == 0) then
            player:messageSpecial(ID.text.ADAUNEL_DIALOG);
            player:addCharVar("FFR", -1)
            player:setCharVar("tradeAdaunel",1);
            player:messageSpecial(ID.text.FLYER_ACCEPTED);
            player:tradeComplete();
        elseif (player:getCharVar("tradeAdaunel") == 1) then
            player:messageSpecial(ID.text.FLYER_ALREADY);
        end
    end
end;

function onTrigger(player,npc)
    player:startEvent(656);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
