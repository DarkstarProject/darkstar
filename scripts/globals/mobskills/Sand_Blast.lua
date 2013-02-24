---------------------------------------------------
-- Sand Blast
-- Deals Earth damage to targets in a fan-shaped area of effect. Additional effect: Blind
-- Range: 8' cone
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_BLINDNESS;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 20, 0, 120));


    return typeEffect;
end;
