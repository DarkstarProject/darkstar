---------------------------------------------
--  Black Cloud
--
--  Description: A cloud deals Dark damage to enemies in an area of effect. Additional effect: Blind
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 15' radial
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
	local message = MSG_MISS;
	local typeEffect = EFFECT_BLINDNESS;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,8);
		if(resist > 0.5) then
			message = MSG_ENFEEB_IS;
			target:addStatusEffect(typeEffect,1,0,60);--power=1;tic=0;duration=60;
		end
	else
		message = MSG_NO_EFFECT;
	end
	skill:setMsg(message);

	local dmgmod = 1.2;
	local accmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
