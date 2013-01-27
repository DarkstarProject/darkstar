---------------------------------------------
--  Acid Breath
--
--  Description: Deals Water damage to enemies in a fan-shaped area of effect. Additional effect: STR Down
--  Type: Breath
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
--  Notes:
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_STR_DOWN;
	local statmod = MOD_INT;
	local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,3);
	if(resist > 0.2) then
		target:addStatusEffect(typeEffect,50,0,120);--power=50;tic=0;duration=120;
	end

    local dmgmod = MobBreathMove(mob, target, 0.1, 1.25, ELE_WATER);

	local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
