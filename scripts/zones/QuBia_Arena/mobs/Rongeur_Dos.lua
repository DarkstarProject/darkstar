-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Rongeur D'os
-- BCNM: Let Sleeping Dogs Die
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn (mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mob:getID() - 2):getShortID())
end

function onMobDeath(mob, player, isKiller)
end
