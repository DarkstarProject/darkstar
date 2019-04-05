-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  ZNM: Cheese Hoarder Gigiroon
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/status")
----------------------------------
-- TODO: Running around mechanic and dropping bombs
function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
end

function onMobFight(mob,target)
end

function onMobDeath(mob)
end