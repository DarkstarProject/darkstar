---------------------------------------------------
-- Animating Wail
-- Increases attack speed.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_HASTE;
    skill:setMsg(MobBuffMove(mob, typeEffect, 153, 0, 300));
    return typeEffect;
end
