-----------------------------------
-- Area: Horlais Peak
--  Mob: Fighting Sheep
-- BCNM: Hostile Herbivores
-- TODO: melee attacks cause knockback.
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(dsp.mod.ICERES, 75)
end

function onMobDeath(mob, player, isKiller)
end
