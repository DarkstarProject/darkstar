-----------------------------------
-- Ability: Violent Flourish
-- Stuns target with a low rate of success. Requires one Finishing Move.
-- Obtained: Dancer Level 45
-- Finishing Moves Used: 1
-- Recast Time: 0:20
-- Duration: ??
-----------------------------------
require("scripts/globals/weaponskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getAnimation() ~= 1) then
        return dsp.msg.basic.REQUIRES_COMBAT,0
    else
        if (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_1)) then
            player:delStatusEffect(dsp.effect.FINISHING_MOVE_1)
            return 0,0
        elseif (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_2)) then
            player:delStatusEffectSilent(dsp.effect.FINISHING_MOVE_2)
            player:addStatusEffect(dsp.effect.FINISHING_MOVE_1,1,0,7200)
            return 0,0
        elseif (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_3)) then
            player:delStatusEffectSilent(dsp.effect.FINISHING_MOVE_3)
            player:addStatusEffect(dsp.effect.FINISHING_MOVE_2,1,0,7200)
            return 0,0
        elseif (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_4)) then
            player:delStatusEffectSilent(dsp.effect.FINISHING_MOVE_4)
            player:addStatusEffect(dsp.effect.FINISHING_MOVE_3,1,0,7200)
            return 0,0
        elseif (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_5)) then
            player:delStatusEffectSilent(dsp.effect.FINISHING_MOVE_5)
            player:addStatusEffect(dsp.effect.FINISHING_MOVE_4,1,0,7200)
            return 0,0
        else
            return dsp.msg.basic.NO_FINISHINGMOVES,0
        end
    end
end

function onUseAbility(player,target,ability,action)
    local hit = 4
    --get fstr
    local fstr = fSTR(player:getStat(dsp.mod.STR),target:getStat(dsp.mod.VIT),player:getWeaponDmgRank())

    local params = {}
    params.atk100 = 1 params.atk200 = 1 params.atk300 = 1

    --apply WSC
    local weaponDamage = player:getWeaponDmg()

    if (player:getWeaponSkillType(dsp.slot.MAIN) == 1) then
        local h2hSkill = ((player:getSkillLevel(1) * 0.11) + 3)
        weaponDamage = player:getWeaponDmg()-3

        weaponDamage = weaponDamage + h2hSkill
    end

    local base = weaponDamage + fstr
    local cratio, ccritratio = cMeleeRatio(player, target, params, 0)
    local isSneakValid = player:hasStatusEffect(dsp.effect.SNEAK_ATTACK)
    if (isSneakValid and not player:isBehind(target)) then
        isSneakValid = false
    end
    local pdif = generatePdif (cratio[1], cratio[2], true)
    local hitrate = getHitRate(player,target,true)

    if (math.random() <= hitrate or isSneakValid) then
        hit = 3
        dmg = base * pdif

        local spell = getSpell(252)
        local params = {}
        params.diff = 0
        params.skillType = player:getWeaponSkillType(dsp.slot.MAIN)
        params.bonus = 50 - target:getMod(dsp.mod.STUNRES) + player:getMod(dsp.mod.VFLOURISH_MACC)
        local resist = applyResistance(player, target, spell, params)

        if resist > 0.25 then
            target:addStatusEffect(dsp.effect.STUN, 1, 0, 2)
        else
            ability:setMsg(dsp.msg.basic.JA_DAMAGE)
        end

        dmg = utils.stoneskin(target, dmg)
        target:takeDamage(dmg, player, dsp.attackType.PHYSICAL, player:getWeaponDamageType(dsp.slot.MAIN))
        target:updateEnmityFromDamage(player,dmg)

        action:animation(target:getID(), getFlourishAnimation(player:getWeaponSkillType(dsp.slot.MAIN)))
        action:speceffect(target:getID(), hit)
        return dmg
    else
        ability:setMsg(dsp.msg.basic.JA_MISS)
        return 0
    end
end
