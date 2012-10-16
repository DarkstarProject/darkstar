---------------------------------------------
--  Light of Penance
--
--  Description: Reduces an enemy's TP. Additional effect: Blindness and "Bind".
--  Type: Magical (Light)
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	target:setTP(0);

	local statmod = MOD_INT;
	local resist = 1;
	local typeEffect = EFFECT_BLINDNESS;
	if(target:hasStatusEffect(typeEffect) == false) then
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,8);
		if(resist > 0.5) then
			target:addStatusEffect(typeEffect,40,0,60);--power=40;tic=0;duration=60;
		end
	end

	typeEffect = EFFECT_BIND;
	if(target:hasStatusEffect(typeEffect) == false) then
		--statmod = MOD_INT;
		resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,5);
		if(resist > 0.5) then
			skill:setMsg(MSG_ENFEEB_IS);
			target:addStatusEffect(typeEffect,1,0,60);--power=1;tic=0;duration=60;
		else
			skill:setMsg(MSG_MISS);
		end
	else
		skill:setMsg(MSG_NO_EFFECT);
	end
	return typeEffect;
end;
