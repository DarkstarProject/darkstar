---------------------------------------------------
-- Splash Breath
-- Deals Water damage in a fan-shaped cone area of effect.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local dmgmod = MobBreathMove(mob, target, 0.2, 0.75);
	local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
