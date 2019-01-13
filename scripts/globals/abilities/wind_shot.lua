-----------------------------------
-- Ability: Wind Shot
-- Consumes a Wind Card to enhance wind-based debuffs. Deals wind-based magic damage
-- Choke Effect: Enhanced DoT and VIT-
-----------------------------------
require("scripts/globals/ability")
require("scripts/globals/magic")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    --ranged weapon/ammo: You do not have an appropriate ranged weapon equipped.
    --no card: <name> cannot perform that action.
    if player:getWeaponSkillType(dsp.slot.RANGED) ~= dsp.skill.MARKSMANSHIP or player:getWeaponSkillType(dsp.slot.AMMO) ~= dsp.skill.MARKSMANSHIP then
        return 216, 0
    end
    if player:hasItem(2178, 0) or player:hasItem(2974, 0) then
        return 0, 0
    else
        return 71, 0
    end
end

function onUseAbility(player, target, ability, action)
    local params = {}
    params.includemab = true
    local dmg = (2 * (player:getRangedDmg() + player:getAmmoDmg()) + player:getMod(dsp.mod.QUICK_DRAW_DMG)) * (1 + player:getMod(dsp.mod.QUICK_DRAW_DMG_PERCENT) / 100)
    dmg  = addBonusesAbility(player, dsp.magic.ele.WIND, target, dmg, params)
    local bonusAcc = player:getStat(dsp.mod.AGI) / 2 + player:getMerit(dsp.merit.QUICK_DRAW_ACCURACY) + player:getMod(dsp.mod.QUICK_DRAW_MACC)
    dmg = dmg * applyResistanceAbility(player, target, dsp.magic.ele.WIND, dsp.skill.NONE, bonusAcc)
    dmg = adjustForTarget(target, dmg, dsp.magic.ele.WIND)

    params.targetTPMult = 0 -- Quick Draw does not feed TP
    dmg = takeAbilityDamage(target, player, params, true, dmg, dsp.attackType.MAGICAL, dsp.damageType.WIND, dsp.slot.RANGED, 1, 0, 0, 0, action, nil)

    if dmg > 0 then
        local effects = {}
        local choke = target:getStatusEffect(dsp.effect.CHOKE)
        if choke ~= nil then
            table.insert(effects, choke)
        end

        local threnody = target:getStatusEffect(dsp.effect.THRENODY)
        if threnody ~= nil and threnody:getSubPower() == dsp.mod.EARTHRES then
            table.insert(effects, threnody)
        end
        --TODO: Frightful Roar
        --[[local frightfulRoar = target:getStatusEffect(dsp.effect.)
        if (frightfulRoar ~= nil) then
            effects[counter] = frightfulRoar
            counter = counter + 1
        end]]

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
            power = power * 1.2
            target:delStatusEffectSilent(effectId)
            target:addStatusEffect(effectId, power, tick, duration, subId, subpower, tier)
            local newEffect = target:getStatusEffect(effectId)
            newEffect:setStartTime(startTime)
        end
    end

    local del = player:delItem(2178, 1) or player:delItem(2974, 1)
    target:updateClaim(player)
    return dmg
end