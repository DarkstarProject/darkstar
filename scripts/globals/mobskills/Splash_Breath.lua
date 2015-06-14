---------------------------------------------------
-- Splash Breath
-- Deals Water damage in a fan-shaped cone area of effect.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = MobBreathMove(mob, target, 0.1, 0.75, ELE_WATER, 400);
	local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_WATER,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
