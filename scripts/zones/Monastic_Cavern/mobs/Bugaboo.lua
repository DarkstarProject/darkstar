-----------------------------------
-- Area: Monastic Cavern
--   NM: Bugaboo
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1) -- "Has additional effect: Drain ..."
    mob:setMod(tpz.mod.UFASTCAST, 50) -- "His spells have very fast cast, my guess would be close to 50% less casting time."
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.HP_DRAIN, {chance = 20, power = math.random(300, 375)}) -- "... more than occasionally for 300 damage or more."
end

function onMobDeath(mob, player, isKiller)
    player:setCharVar("circleTime", 8) -- Set flag so that final CS will show when you interact with alter again
end