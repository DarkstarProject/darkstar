-----------------------------------
-- Area: Behemoth's Dominion
--  MOB: Doglix Muttsnout
-- Involved in Quest: The Talekeeper's Gift
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/quests")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if player:getQuestStatus(BASTOK,THE_TALEKEEPER_S_GIFT) == QUEST_ACCEPTED then
        player:addVar("theTalekeepersGiftKilledNM", 1)
    end
end