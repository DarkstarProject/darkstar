-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Flesh Eater
-- BCNM: The Worm's Turn
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    local mobId = mob:getID()
    local offset = (mobId - ID.mob.FLAYER_FRANZ_OFFSET) % 17
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mobId - offset):getShortID())
    mob:setMobMod(dsp.mobMod.CHARMABLE, 1)
end

function onMobDeath(mob, player, isKiller)
end
