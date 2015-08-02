---------------------------------------------------
-- Hexagon Belt
-- Enhances defense by 20%.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_DEFENSE_BOOST;
    skill:setMsg(MobBuffMove(mob, typeEffect, 20, 0, 120));
    return typeEffect;
end;
