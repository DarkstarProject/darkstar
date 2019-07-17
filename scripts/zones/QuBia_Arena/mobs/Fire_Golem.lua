-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Fire Golem
-- BCNM: Idol Thoughts
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, mob:getShortID())
end

function onMobDeath(mob, player, isKiller)
end
