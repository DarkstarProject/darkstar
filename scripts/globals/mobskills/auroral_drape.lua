---------------------------------------------
-- Auroral Drape
--
-- Description: Silence and Blind Area of Effect (10.0')
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
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
    local silenced = false;
    local blinded = false;

    silenced = MobStatusEffectMove(mob, target, EFFECT_SILENCE, 1, 0, 60);

    blinded = MobStatusEffectMove(mob, target, EFFECT_BLINDNESS, 60, 0, 60);

    skill:setMsg(msgBasic.SKILL_ENFEEB_IS);

    -- display silenced first, else blind
    if (silenced == msgBasic.SKILL_ENFEEB_IS) then
        typeEffect = EFFECT_SILENCE;
    elseif (blinded == msgBasic.SKILL_ENFEEB_IS) then
        typeEffect = EFFECT_BLINDNESS;
    else
        skill:setMsg(msgBasic.SKILL_MISS);
    end

    return typeEffect;
end;
