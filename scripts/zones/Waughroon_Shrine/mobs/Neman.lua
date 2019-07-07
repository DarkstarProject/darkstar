-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Neman
-- BCNM: Birds of a Feather
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(dsp.mod.SLEEPRES, 50)
end

function onMobSpawn(mob)
    local mobId = mob:getID()
    local offset = (mobId - ID.mob.MACHA_OFFSET) % 4
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mobId - offset):getShortID())
    mob:setMobMod(dsp.mobMod.CHARMABLE, 1)
end

function onMobDeath(mob, player, isKiller)
end
