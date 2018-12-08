---------------------------------------------
-- Horrid Roar (Tiamat, Jormungand, Vrtra, Ouryu)
-- Dispels all buffs including food. Lowers Enmity.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:hasStatusEffect(dsp.effect.MIGHTY_STRIKES)) then
        return 1
    elseif (mob:hasStatusEffect(dsp.effect.INVINCIBLE)) then
        return 1
    elseif (mob:hasStatusEffect(dsp.effect.BLOOD_WEAPON)) then
        return 1
    elseif (target:isBehind(mob, 48) == true) then
        return 1
    elseif (mob:AnimationSub() == 1) then
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dispel =  target:dispelAllStatusEffect(bit.bor(dsp.effectFlag.DISPELABLE, dsp.effectFlag.FOOD))

    if (dispel == 0) then
        -- no effect
        skill:setMsg(dsp.msg.basic.SKILL_NO_EFFECT) -- no effect
    else
        skill:setMsg(dsp.msg.basic.DISAPPEAR_NUM)
    end

    mob:lowerEnmity(target, 70)

    return dispel
end
