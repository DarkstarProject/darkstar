-----------------------------------
-- Area: Misareaux Coast
--   NM: Gration
-----------------------------------
mixins = {require("scripts/mixins/fomor_hate")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:addStatusEffect(dsp.effect.KILLER_INSTINCT, 40, 0, 0)
    mob:setLocalVar("fomorHateAdj", -2)
end

function onMobDeath(mob, player, isKiller)
end