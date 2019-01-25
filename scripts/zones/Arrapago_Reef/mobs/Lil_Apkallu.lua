-----------------------------------
-- Area: Arrapago Reef
--  ZNM: Lil Apkallu
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/status")
-----------------------------------
-- Todo: Apkallu hate, Hundred Fists, Movement and TP pattern

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
end

function onMobDeath(mob, player, isKiller)
end
