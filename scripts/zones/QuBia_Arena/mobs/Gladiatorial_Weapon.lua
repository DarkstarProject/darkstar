-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Gladiatorial Weapon
-- BCNM: Die by the Sword
-----------------------------------
local ID = require("scripts/zones/QuBia_Arena/IDs")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(dsp.mod.UDMGMAGIC, -100)
end

function onMobSpawn (mob)
    local mobId = mob:getID()
    local offset = (mobId - ID.mob.GLADIATORIAL_WEAPON_OFFSET) % 4
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mobId - offset):getShortID())
end

function onMobDeath(mob, player, isKiller)
end
