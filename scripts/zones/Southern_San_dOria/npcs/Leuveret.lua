-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Leuveret
-- General Info NPC
-------------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs");
require("scripts/globals/quests");

function onTrade(player,npc,trade)
    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1 and player:getCharVar("tradeLeuveret") == 0) then
            player:messageSpecial(ID.text.LEUVERET_DIALOG);
            player:addCharVar("FFR", -1)
            player:setCharVar("tradeLeuveret",1);
            player:messageSpecial(ID.text.FLYER_ACCEPTED);
            player:tradeComplete();
        elseif (player:getCharVar("tradeLeuveret") == 1) then
            player:messageSpecial(ID.text.FLYER_ALREADY);
        end
    end
end;

function onTrigger(player,npc)
    player:startEvent(621);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
