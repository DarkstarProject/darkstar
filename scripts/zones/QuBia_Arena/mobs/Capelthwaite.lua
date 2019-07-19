-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Capelthwaite
-- BCNM: Let Sleeping Dogs Die
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn (mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, mob:getShortID())
end

function onMobDeath(mob, player, isKiller)
end
