-----------------------------------
-- Area: Horlais Peak
--  Mob: Fighting Sheep
-- BCNM: Hostile Herbivores
-- TODO: melee attacks cause knockback.
-----------------------------------
local ID = require("scripts/zones/Horlais_Peak/IDs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn (mob)
    local mobId = mob:getID()
    local offset = (mobId - ID.mob.FIGHTING_SHEEP_OFFSET) % 4
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mobId - offset):getShortID())
end

function onMobInitialize(mob)
    mob:setMod(dsp.mod.ICERES, 75)
end

function onMobDeath(mob, player, isKiller)
end
