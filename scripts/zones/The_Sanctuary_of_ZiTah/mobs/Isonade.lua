-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--   NM: Isonade
-- Involved in Quest: The Sacred Katana
-----------------------------------
require("scripts/globals/quests")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if player:getQuestStatus(OUTLANDS, dsp.quest.id.outlands.THE_SACRED_KATANA) == QUEST_ACCEPTED then
        player:setVar("IsonadeKilled", 1)
    end
end