---------------------------------------------------
-- Feeble Bleat
-- Emits a unnerving bleat that paralyzes down players in range.
--
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_PARALYSIS;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 25, 0, 120));

    return typeEffect;
end;
