-----------------------------------
-- Ability: Light Shot
-- Consumes a Light Card to enhance light-based debuffs. Additional effect: Light-based Sleep
-- Dia Effect: Defense Down Effect +5% and DoT + 1
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
    if player:hasItem(2182, 0) or player:hasItem(2974, 0) then
        return 0, 0
    else
        return 71, 0
    end
end

function onUseAbility(player, target, ability)
    local duration = 60
    local bonusAcc = player:getStat(dsp.mod.AGI) / 2 + player:getMerit(dsp.merit.QUICK_DRAW_ACCURACY) + player:getMod(dsp.mod.QUICK_DRAW_MACC)
    local resist = applyResistanceAbility(player, target, dsp.magic.ele.LIGHT, dsp.skill.NONE, bonusAcc)

    if resist < 0.5 then
        ability:setMsg(dsp.msg.basic.JA_MISS_2) -- resist message
        return dsp.effect.SLEEP_I
    end

    duration = duration * resist

    local effects = {}
    local dia = target:getStatusEffect(dsp.effect.DIA)
    if dia ~= nil then
        table.insert(effects, dia)
    end
    local threnody = target:getStatusEffect(dsp.effect.THRENODY)
    if threnody ~= nil and threnody:getSubPower() == dsp.mod.DARKRES then
        table.insert(effects, threnody)
    end

    if #effects > 0 then
        local effect = effects[math.random(#effects)]
        local duration = effect:getDuration()
        local startTime = effect:getStartTime()
        local tick = effect:getTick()
        local power = effect:getPower()
        local subpower = effect:getSubPower()
        local tier = effect:getTier()
        local effectId = effect:getType()
        local subId = effect:getSubType()
        power = power * 1.5
        subpower = subpower * 1.5
        target:delStatusEffectSilent(effectId)
        target:addStatusEffect(effectId, power, tick, duration, subId, subpower, tier)
        local newEffect = target:getStatusEffect(effectId)
        newEffect:setStartTime(startTime)
    end

    if target:addStatusEffect(dsp.effect.SLEEP_I, 1, 0, duration) then
        ability:setMsg(dsp.msg.basic.JA_ENFEEB_IS)
    else
        ability:setMsg(dsp.msg.basic.JA_NO_EFFECT_2)
    end

    local del = player:delItem(2182, 1) or player:delItem(2974, 1)
    target:updateClaim(player)
    return dsp.effect.SLEEP_I
end