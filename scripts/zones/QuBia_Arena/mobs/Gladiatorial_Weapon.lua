-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Gladiatorial Weapon
-- BCNM: Die by the Sword
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(dsp.mod.UDMGMAGIC, -100)
end

function onMobDeath(mob, player, isKiller)
end
