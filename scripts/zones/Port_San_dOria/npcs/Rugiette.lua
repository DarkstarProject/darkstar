-----------------------------------
-- Area: Port San d'Oria
--  NPC: Rugiette
-- Involved in Quests: Riding on the Clouds, Lure of the Wildcat (San d'Oria)
-- !pos 71 -9 -73 232
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart Flyer
            player:messageSpecial(ID.text.FLYER_REFUSED);
        end
    end

    if (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getCharVar("ridingOnTheClouds_1") == 8) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setCharVar("ridingOnTheClouds_1",0);
            player:tradeComplete();
            player:addKeyItem(dsp.ki.SCOWLING_STONE);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SCOWLING_STONE);
        end
    end

end;

function onTrigger(player,npc)
    local WildcatSandy = player:getCharVar("WildcatSandy");

    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,14) == false) then
        player:startEvent(746);
    else
        player:startEvent(601);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 746) then
        player:setMaskBit(player:getCharVar("WildcatSandy"),"WildcatSandy",14,true);
    elseif (csid == 601) then
        if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_AVAILABLE and player:getCharVar("FFR") == 0) then
            player:setCharVar("FFR",1);
        end
    end
end;