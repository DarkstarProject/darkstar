---------------------------------------------
-- Deadeye
-- Family: Qiqurn
-- Description: Lowers the defense and magical defense of enemies within range.
-- Type: Magical
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Unknown
-- Notes: Used only by certain Notorious Monsters. Strong effect.
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local defDown = false;
    local mDefDown = false;

    defDown = MobStatusEffectMove(mob, target, EFFECT_DEFENSE_DOWN, 50, 0, 120);
    mDefDown = MobStatusEffectMove(mob, target, EFFECT_MAGIC_DEF_DOWN, 50, 0, 120);

    skill:setMsg(msgBasic.SKILL_ENFEEB_IS);

    -- display defense down first, else magic defense down
    if (defDown == msgBasic.SKILL_ENFEEB_IS) then
        typeEffect = EFFECT_DEFENSE_DOWN;
    elseif (mDefDown == msgBasic.NFEEB_IS) then
        typeEffect = EFFECT_MAGIC_DEF_DOWN;
    else
        skill:setMsg(msgBasic.SKILL_MISS);
    end;

    return typeEffect;
end;
