---------------------------------------------
--  Healing Stomp
--
--  Description: Stomps the ground to apply regeneration.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes: Only used by notorious monsters.
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local power = 25;
    local duration = 180;

    local typeEffect = EFFECT_REGEN;

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 3, duration));
    return typeEffect;
end;
