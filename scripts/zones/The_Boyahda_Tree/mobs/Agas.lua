-----------------------------------
-- Area: The Boyahda Tree
--   NM: Agas
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if player:getQuestStatus(JEUNO, dsp.quest.id.jeuno.SEARCHING_FOR_THE_RIGHT_WORDS) == QUEST_ACCEPTED and not player:hasKeyItem(dsp.ki.MOONDROP) then
        player:setCharVar("Searching_AgasKilled", 1)
    end
end