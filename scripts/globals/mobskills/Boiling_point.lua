---------------------------------------------
--  Boiling Point
--
--  Description: Reduces magic defense in a fan-shaped area of effect.
--  Type: Magical
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_MAGIC_DEF_DOWN;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 20, 0, 180));
    return typeEffect;
end;