-----------------------------------
-- Area: Behemoth's Dominion
--  MOB: Moxnix Nightgoggle
-- Involved in Quest: The Talekeeper's Gift
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/quests")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.EES_GOBLIN)
end

function onMobDeath(mob, player, isKiller)
    if player:getQuestStatus(BASTOK,THE_TALEKEEPER_S_GIFT) == QUEST_ACCEPTED then
        player:addVar("theTalekeepersGiftKilledNM", 1)
    end
end