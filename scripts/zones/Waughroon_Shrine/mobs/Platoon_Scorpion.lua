-----------------------------------
-- Area: Waughroon Shrine
--  MOB: Platoon Scorpion
-- BCNM: Operation Desert Swarm
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    local mobId = mob:getID()
    local offset = (mobId - ID.mob.PLATOON_SCORPION_OFFSET) % 7
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mobId - offset):getShortID())
end

function onMobDeath(mob, player, isKiller)
end
