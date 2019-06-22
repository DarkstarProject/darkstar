---------------------------------------------
-- Seal of Quiescence
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    mob:showText(mob, PROMATHIA_TEXT + 6)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.MUTE
    local power = 30
    local duration = 75

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, duration))

    return typeEffect
end
