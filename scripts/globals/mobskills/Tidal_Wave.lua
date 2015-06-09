---------------------------------------------------
-- Tidal Wave
-- Deals water elemental damage to enemies within area of effect.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)

	dmgmod = 1;
	info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 6,ELE_WATER,dmgmod,TP_NO_EFFECT,1);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;

end