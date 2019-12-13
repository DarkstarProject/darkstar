-----------------------------------
-- Area: Jugner Forest [S]
--  Mob: Cobraclaw Buchzvotch
-- Wrath of the Griffon Fight
-----------------------------------
require("scripts/globals/quests")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.WRATH_OF_THE_GRIFFON) == QUEST_ACCEPTED then
        player:setCharVar("CobraClawKilled", 1)
    end
end