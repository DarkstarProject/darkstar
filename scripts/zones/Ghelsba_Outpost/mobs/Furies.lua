-----------------------------------
-- Area: Ghelsba Outpost
--  Mob: Furies
-- BCNM: Wings of Fury
-----------------------------------
local ID = require("scripts/zones/Ghelsba_Outpost/IDs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    local mobId = mob:getID()
    local offset = mobId - ID.mob.COLO_COLO_OFFSET
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mobId - offset):getShortID())
    mob:setMobMod(dsp.mobMod.CHARMABLE, 1)
end

function onMobDeath(mob, player, isKiller)
end
