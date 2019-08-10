-----------------------------------
-- Area: Horlais Peak
--  Mob: Cottontail
-- BCNM: Tails of Woe
-----------------------------------
local ID = require("scripts/zones/Horlais_Peak/IDs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn (mob)
    local mobId = mob:getID()
    local offset = (mobId - ID.mob.HELLTAIL_HARRY_OFFSET) % 9
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mobId - offset):getShortID())
end

function onMobDeath(mob, player, isKiller)
end