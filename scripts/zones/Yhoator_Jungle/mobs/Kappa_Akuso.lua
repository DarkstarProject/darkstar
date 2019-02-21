-----------------------------------
-- Area: Yhoator Jungle
--   NM: Kappa Akuso
-- Involved in Quest: True will
-----------------------------------
require("scripts/globals/quests")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if player:getQuestStatus(OUTLANDS,dsp.quest.id.outlands.TRUE_WILL) == QUEST_ACCEPTED then
        player:addVar("trueWillKilledNM", 1)
    end
end