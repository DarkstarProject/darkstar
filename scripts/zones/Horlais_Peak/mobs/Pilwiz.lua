-----------------------------------
-- Area: Horlais Peak
--  Mob: Pilwiz
-- BCNM: Carapace Combatants
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn (mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, mob:getShortID())
end

function onMobDeath(mob, player, isKiller)
end