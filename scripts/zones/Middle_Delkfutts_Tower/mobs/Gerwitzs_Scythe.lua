-----------------------------------
-- Area: Middle Delkfutt's Tower
--   NM: Gerwitz's Scythe
-- Involved In Quest: Blade of Evil
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/quests")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.HP_DRAIN)
end

function onMobDeath(mob, player, isKiller)
    if player:getQuestStatus(BASTOK, dsp.quest.id.bastok.BLADE_OF_EVIL) == QUEST_ACCEPTED then
        player:setCharVar("bladeOfEvilCS", 1)
    end
end