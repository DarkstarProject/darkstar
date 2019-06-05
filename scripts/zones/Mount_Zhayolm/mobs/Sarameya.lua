-----------------------------------
-- Area: Mount Zhayolm
--   NM: Sarameya
-- !pos 322 -14 -581 61
-- Spawned with Buffalo Corpse: !additem 2583
-- Wiki: http://ffxiclopedia.wikia.com/wiki/Sarameya
-- TODO: PostAIRewrite: Code the Howl effect and gradual resists.
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.GA_CHANCE, 50)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:addMod(dsp.mod.MEVA, 95)
    mob:addMod(dsp.mod.MDEF, 30)
    mob:addMod(dsp.mod.SILENCERES, 20)
    mob:addMod(dsp.mod.GRAVITYRES, 20)
    mob:addMod(dsp.mod.LULLABYRES, 30)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
end

function onMobRoam(mob)
end

function onMobFight(mob, target)
    local hpp = mob:getHPP()
    local useChainspell = false

    if hpp < 90 and mob:getLocalVar("chainspell89") == 0 then
        mob:setLocalVar("chainspell89", 1)
        useChainspell = true
    elseif hpp < 70 and mob:getLocalVar("chainspell69") == 0 then
        mob:setLocalVar("chainspell69", 1)
        useChainspell = true
    elseif hpp < 50 and mob:getLocalVar("chainspell49") == 0 then
        mob:setLocalVar("chainspell49", 1)
        useChainspell = true
    elseif hpp < 30 and mob:getLocalVar("chainspell29") == 0 then
        mob:setLocalVar("chainspell29", 1)
        useChainspell = true
    elseif hpp < 10 and mob:getLocalVar("chainspell9") == 0 then
        mob:setLocalVar("chainspell9", 1)
        useChainspell = true
    end

    if useChainspell then
        mob:useMobAbility(692) -- Chainspell
        mob:setMobMod(dsp.mobMod.GA_CHANCE, 100)
    end

    -- Spams TP moves and -ga spells
    if mob:hasStatusEffect(dsp.effect.CHAINSPELL) then
        mob:setTP(2000)
    else
        if mob:getMobMod(dsp.mobMod.GA_CHANCE) == 100 then
            mob:setMobMod(dsp.mobMod.GA_CHANCE, 50)
        end
    end

    -- Regens 1% of his HP a tick with Blaze Spikes on
    if mob:hasStatusEffect(dsp.effect.BLAZE_SPIKES) then
        mob:setMod(dsp.mod.REGEN, math.floor(mob:getMaxHP()/100))
    else
        if mob:getMod(dsp.mod.REGEN) > 0 then
            mob:setMod(dsp.mod.REGEN, 0)
        end
    end
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.POISON, {chance = 40, power = 50})
end

function onMobDeath(mob, player, isKiller)
end
