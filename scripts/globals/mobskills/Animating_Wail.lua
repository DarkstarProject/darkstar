---------------------------------------------------
--  Animating Wail
--  Family: Qutrub
--  Description: Let's out a wail that applies Haste to itself and nearby allies.
--  Type: Enhancing
--  Can be dispelled: Yes
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes:
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local power = 153;
    local duration = 300;
    local typeEffect = EFFECT_HASTE;

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration));
    return typeEffect;
end
