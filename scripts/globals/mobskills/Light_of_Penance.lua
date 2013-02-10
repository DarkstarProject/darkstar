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
	local tpReduced = 0;
	target:setTP(tpReduced);

	local statmod = MOD_INT;
	local resist = 1;
	local typeEffect = EFFECT_BLINDNESS;
	if(target:hasStatusEffect(typeEffect) == false and target:isFacing(mob)) then
		local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_DARK);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,40,0,60*resist);--power=40;tic=0;duration=60;
		end
	end

	typeEffect = EFFECT_BIND;
	if(target:hasStatusEffect(typeEffect) == false and target:isFacing(mob)) then
		--statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_ICE);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,1,0,30*resist);--power=1;tic=0;duration=60;
		end
	end


	skill:setMsg(MSG_TP_REDUCED);

	return tpReduced;
end;
