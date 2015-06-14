---------------------------------------------------
-- Shell Guard
-- Increases defense of user.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local base = 100;
	local typeEffect = EFFECT_DEFENSE_BOOST;
    skill:setMsg(MobBuffMove(mob, typeEffect, base, 0, 180));
	return typeEffect;
end
