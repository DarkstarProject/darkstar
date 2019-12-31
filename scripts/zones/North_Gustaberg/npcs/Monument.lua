-----------------------------------
-- Area: North Gustaberg
--  NPC: Monument
-- Involved in Quest "Hearts of Mythril"
-- !pos 300.000 -62.803 498.200 106
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if
        player:getQuestStatus(BASTOK, dsp.quest.id.bastok.HEARTS_OF_MYTHRIL) == QUEST_ACCEPTED and
        player:hasKeyItem(dsp.ki.BOUQUETS_FOR_THE_PIONEERS)
    then
        player:startEvent(11)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 11 and option == 0 then
        player:setCharVar("HeartsOfMythril", 1)
        player:delKeyItem(dsp.ki.BOUQUETS_FOR_THE_PIONEERS)
    end
end
