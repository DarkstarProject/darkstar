---------------------------------------------------
-- Hydro Wave
-- Deals Water damage and strips one piece of equipment. User temporarily gains ability to absorb Water elemental damage.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

	local slot = math.random(0,8);
	local dmgmod = 2;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 4,ELE_WATER,dmgmod,TP_MAB_BONUS,1);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	mob:addMod(MOD_WATER_ABSORB,75);
	
	return dmg;

end