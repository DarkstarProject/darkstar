-----------------------------------
-- Area: Ghelsba Outpost
--  Mob: Toadsquab
-- BCNM: Toadal Recall
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mob:getID() - 1):getShortID())
end

function onMobDeath(mob, player, isKiller)
end
