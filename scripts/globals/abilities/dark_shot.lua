-----------------------------------
-- Ability: Dark Shot
-- Consumes a Dark Card to enhance dark-based debuffs. Additional effect: Dark-based Dispel
-- Bio Effect: Attack Down Effect +5% and DoT + 3
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    --ranged weapon/ammo: You do not have an appropriate ranged weapon equipped.
    --no card: <name> cannot perform that action.
    if player:getWeaponSkillType(dsp.slot.RANGED) ~= dsp.skill.MARKSMANSHIP or player:getWeaponSkillType(dsp.slot.AMMO) ~= dsp.skill.MARKSMANSHIP then
        return 216, 0
    end
    if player:hasItem(2183, 0) or player:hasItem(2974, 0) then
        return 0, 0
    else
        return 71, 0
    end
end

function onUseAbility(player, target, ability)
    local bonusAcc = player:getStat(dsp.mod.AGI) / 2 + player:getMerit(dsp.merit.QUICK_DRAW_ACCURACY) + player:getMod(dsp.mod.QUICK_DRAW_MACC)
    local resist = applyResistanceAbility(player, target, dsp.magic.ele.DARK, dsp.skill.NONE, bonusAcc)

    if resist < 0.25 then
        ability:setMsg(dsp.msg.basic.JA_MISS_2) -- resist message
        return 0
    end

    local bio = target:getStatusEffect(dsp.effect.BIO)
    local blind = target:getStatusEffect(dsp.effect.BLINDNESS)
        
    if bio ~= nil then
        local duration = bio:getDuration()
        local startTime = bio:getStartTime()
        local tick = bio:getTick()
        local power = bio:getPower()
        local subpower = bio:getSubPower()
        local tier = bio:getTier()
        local subId = bio:getSubType()
        power = power + 3 -- +3 damage DOT
        subpower = subpower * 1.05 -- 5% Attack down
        target:delStatusEffectSilent(dsp.effect.BIO)
        target:addStatusEffect(dsp.effect.BIO, power, tick, duration, subId, subpower, tier)
        local newEffect = target:getStatusEffect(dsp.effect.BIO)
        newEffect:setStartTime(startTime)
    end

    if blind ~= nil then
        local duration = blind:getDuration()
        local startTime = blind:getStartTime()
        local power = blind:getPower()
        power = power * 1.1 -- 10% potency to Blind
        target:delStatusEffectSilent(dsp.effect.BLIND)
        target:addStatusEffect(dsp.effect.BLIND, power, 0, duration)
        local newEffect = target:getStatusEffect(dsp.effect.BLIND)
        newEffect:setStartTime(startTime)
    end

    ability:setMsg(dsp.msg.basic.JA_REMOVE_EFFECT_2)
    local dispelledEffect = target:dispelStatusEffect()
    if dispelledEffect == dsp.effect.NONE then
        -- no effect
        ability:setMsg(dsp.msg.basic.JA_NO_EFFECT_2)
    end

    local del = player:delItem(2183, 1) or player:delItem(2974, 1)
    target:updateClaim(player)
    return dispelledEffect
end