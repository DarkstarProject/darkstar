---------------------------------------------------
-- Bubble Shower
-- Deals Water damage in an area of effect. Additional effect: Spawns Adds on King Arthro Fight
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill,zone)
	mob = mob:getID();
	if (mob == 17129519) then
	local mobids = {17129520,   -- King Arthro's Knights
		17129521,
		17129522,
		17129523,
		17129524,
		17129525,
		17129526,
		17129527,
		17129528,
		17129529,
		17129530,
		17129531}
	local mob = mobids[math.random(1, #mobids)];
	SpawnMob(mob);
	end;
	
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_STR_DOWN;

	MobStatusEffectMove(mob, target, typeEffect, 10, 3, 120);

    local dmgmod = MobBreathMove(mob, target, 0.15, 5, ELE_WATER, 200);

	local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
