---------------------------------------------
--  Maelstrom
--
--  Description: Deals water damage to enemies within range. Additional effect: STR Down.
--  Type: Magical (Water)
--
--
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
	if(resist > 0.1) then
		target:addStatusEffect(typeEffect,50,0,120);--power=50;tic=0;duration=120
	end

	local dmgmod = 1.7;
	local accmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
