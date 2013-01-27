---------------------------------------------
--  Stinking Gas
--
--  Description: Lowers Vitality of enemies within range.
--  Type: Magical (Wind)
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
	local message = MSG_MISS;
	local typeEffect = EFFECT_VIT_DOWN;
	local statmod = MOD_INT;
	local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,4);
	if(resist > 0.2) then
		message = MSG_ENFEEB_IS;
		target:addStatusEffect(typeEffect,10,0,90);--power=50;tic=0;duration=120;
	end

	skill:setMsg(message);
	return typeEffect;
end;
