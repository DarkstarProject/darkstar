---------------------------------------------
--  Zephyr Mantle
--
--  Description: Creates shadow images that each absorb a single attack directed at you.
--  Type: Magical (Wind)
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local base = math.random(4,10);
    local typeEffect = EFFECT_BLINK;
    skill:setMsg(MobBuffMove(mob, typeEffect, base, 0, 180));
    return typeEffect;
end;
