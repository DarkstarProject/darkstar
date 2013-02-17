---------------------------------------------------
-- Gastric Bomb
-- Deals Water damage with a long-range acid bomb. Additional effect: Attack Down
-- Range: Long range
-- Notes: Attack Down effect is 50%.
-- Duration: Three minutes
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_ATTACK_DOWN;
	local statmod = MOD_INT;
	local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_WATER);
	if(resist > 0.2) then
		target:delStatusEffect(typeEffect);
		target:addStatusEffect(typeEffect,50,0,120*resist);--power=50;tic=0;duration=180;
	end

	local dmgmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_WATER,dmgmod,TP_MAB_BONUS,1);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
