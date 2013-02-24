---------------------------------------------------
-- Parry
-- Enhances defense.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_DEFENSE_BOOST;
    skill:setMsg(MobBuffMove(target, typeEffect, 15, 0, 300));
    return typeEffect;
end;
