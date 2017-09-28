---------------------------------------------------
-- Crystal Shield
-- Protect II
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local power = 40;
    local duration = 300;

    local typeEffect = EFFECT_PROTECT;

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration));

    return typeEffect;
end;
