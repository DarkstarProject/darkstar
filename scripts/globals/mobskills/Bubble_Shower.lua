---------------------------------------------------
-- Bubble Shower
-- Deals Water damage in an area of effect. Additional effect: STR Down
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_STR_DOWN;
	local statmod = MOD_INT;
	local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_WATER);
	if(resist > 0.2) then
		target:delStatusEffect(typeEffect);
		target:addStatusEffect(typeEffect,10,0,120*resist); --power=-30;tic=0;duration=180;
	end

    local dmgmod = MobBreathMove(mob, target, 0.04, 5, ELE_WATER, 200);

	local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
