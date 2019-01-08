-----------------------------------
-- Area: Arrapago Reef
--  ZNM: Velionis
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/status")
-----------------------------------
-- Todo: blaze spikes effect only activates while not in casting animation
function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
    mob:SetAutoAttackEnabled(false)
    mob:setMod(dsp.mod.FASTCAST,15)
    mob:setLocalVar("HPP", 90)
    mob:setMobMod(dsp.mobMod.MAGIC_COOL,5)
end

function onMobFight(mob,target)
    local FastCast = mob:getLocalVar("HPP")
    if mob:hasStatusEffect(dsp.effect.BLAZE_SPIKES) == false then
        mob:addStatusEffect(dsp.effect.BLAZE_SPIKES, 200, 0, 0)
    end
    if mob:getHPP() <= FastCast then
	    if mob:getHPP() > 10 then
            mob:addMod(dsp.mod.FASTCAST, 15)
            mob:setLocalVar("HPP", mob:getHPP() - 10)
		end
    end
end

function onMobDeath(mob, player, isKiller)
end
