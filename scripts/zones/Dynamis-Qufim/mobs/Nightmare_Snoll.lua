-----------------------------------
-- Area: Dynamis - Qufim
--  Mob: Nightmare Snoll
-----------------------------------
mixins = {require("scripts/mixins/dynamis_dreamland")}
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("dynamis_currency", 1452)
end

function onMobDeath(mob, player, isKiller)
end
