---------------------------------------------
--  Occultation
--
--  Description: Creates 25 shadows
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
    local base = math.random(10,25);
    local typeEffect = EFFECT_BLINK;

    skill:setMsg(MobBuffMove(mob, typeEffect, base, 0, 120));
    return typeEffect;
end;
