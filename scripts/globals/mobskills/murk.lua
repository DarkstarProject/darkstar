---------------------------------------------
-- Murk
--
-- Description: Slow and Weight Area of Effect (10.0')
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local slowed = false
    local weight = false

    slowed = MobStatusEffectMove(mob, target, dsp.effect.SLOW, 1250, 0, 60)
    weight = MobStatusEffectMove(mob, target, dsp.effect.WEIGHT, 40, 0, 60)

    skill:setMsg(dsp.msg.basic.SKILL_ENFEEB_IS)

    -- display slow first, else weight
    if slowed == dsp.msg.basic.SKILL_ENFEEB_IS then
        typeEffect = dsp.effect.SLOW
    elseif weight == dsp.msg.basic.SKILL_ENFEEB_IS then
        typeEffect = dsp.effect.WEIGHT
    else
        skill:setMsg(dsp.msg.basic.SKILL_MISS)
    end

    return typeEffect
end
