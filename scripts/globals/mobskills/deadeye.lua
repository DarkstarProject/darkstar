---------------------------------------------
-- Deadeye
-- Family: Qiqurn
-- Description: Lowers the defense and magical defense of enemies within range.
-- Type: Magical
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Unknown
-- Notes: Used only by certain Notorious Monsters. Strong dsp.effect.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local defDown = false
    local mDefDown = false

    defDown = MobStatusEffectMove(mob, target, dsp.effect.DEFENSE_DOWN, 50, 0, 120)
    mDefDown = MobStatusEffectMove(mob, target, dsp.effect.MAGIC_DEF_DOWN, 50, 0, 120)

    skill:setMsg(dsp.msg.basic.SKILL_ENFEEB_IS)

    -- display defense down first, else magic defense down
    if (defDown == dsp.msg.basic.SKILL_ENFEEB_IS) then
        typeEffect = dsp.effect.DEFENSE_DOWN
    elseif (mDefDown == dsp.msg.basic.NFEEB_IS) then
        typeEffect = dsp.effect.MAGIC_DEF_DOWN
    else
        skill:setMsg(dsp.msg.basic.SKILL_MISS)
    end

    return typeEffect
end
