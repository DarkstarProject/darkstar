-----------------------------------
-- Area: Port San d'Oria
-- NPC: Fontoumant
-- Involved in Quests: Riding on the Clouds
-- !pos -10 -10 -122 232
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");

local quests =
{
    require("scripts/quests/sandoria/the_brugaire_consortium")
}
quests = dsp.quest.involvedQuests(quests)
-----------------------------------

function onTrade(player,npc,trade)
    local count = trade:getItemCount();

    if not quests.onTrade(player, npc, trade) then
        if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
            if (trade:hasItemQty(532,1) and count == 1) then -- Trade Magicmart Flyer
                player:messageSpecial(ID.text.FLYER_REFUSED);
            end
        end

        if (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_1") == 6) then
            if (trade:hasItemQty(1127,1) and count == 1) then -- Trade Kindred seal
                player:setVar("ridingOnTheClouds_1",0);
                player:tradeComplete();
                player:addKeyItem(dsp.ki.SCOWLING_STONE);
                player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SCOWLING_STONE);
            end
        end
    end

end;

function onTrigger(player,npc)
    if not quests.onTrigger(player, npc) then
        -- Standard dialogue, after completing quest: 'The Brugaire Consortium''
        player:startEvent(561)
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    quests.onEventFinish(player, csid, option)
end;