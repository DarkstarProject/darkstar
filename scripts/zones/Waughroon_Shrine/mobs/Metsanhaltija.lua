-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Metsanhaltija
-- BCNM: Grove Guardians
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(dsp.mod.SLEEPRES, 50)
end

function onMobSpawn(mob)
    local mobId = mob:getID()
    local offset = (mobId - ID.mob.METSANNEITSYT_OFFSET) % 4
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mobId - offset):getShortID())
end

function onMobDeath(mob, player, isKiller)
end
