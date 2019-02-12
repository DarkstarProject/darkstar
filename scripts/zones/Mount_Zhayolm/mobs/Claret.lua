-----------------------------------
-- Area: Mount Zhayolm
--  ZNM: Claret
-- !pos 501 -9 53
-- Spawned with Pectin: !additem 2591
-- Wiki: http://ffxiclopedia.wikia.com/wiki/Claret
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
    mob:addMod(dsp.mod.REGEN, math.floor(mob:getMaxHP()*.004))
    mob:addMod(dsp.mod.BINDRES, 40)
    mob:addMod(dsp.mod.MOVE, 15)
    mob:SetAutoAttackEnabled(false)
end

function onMobFight(mob, target)
    if mob:checkDistance(target) < 3 then
        if not target:hasStatusEffect(dsp.effect.POISON) then
            target:addStatusEffect(dsp.effect.POISON, 100, 3, math.random(3, 6) * 3) -- Poison for 3-6 ticks.
        else
            if target:getStatusEffect(dsp.effect.POISON):getPower() < 100 then
                target:delStatusEffect(dsp.effect.POISON)
                target:addStatusEffect(dsp.effect.POISON, 100, 3, math.random(3, 6) * 3) -- Poison for 3-6 ticks.
            end
        end
    end
end

function onMobDeath(mob, player, isKiller)
end