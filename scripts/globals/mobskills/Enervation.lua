---------------------------------------------
--  Enervation
--
--  Description: Lowers the defense and magical defense of enemies within range.
--  Type: Magical (Dark)
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_DEFENSE_DOWN;
	if(target:hasStatusEffect(typeEffect) == false) then
			local statmod = MOD_INT;
			local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_DARK);
			if(resist > 0.2) then
				skill:setMsg(MSG_ENFEEB_IS);
				target:delStatusEffect(typeEffect);
				target:addStatusEffect(typeEffect,20,0,120*resist);--power=20;tic=0;duration=120;
				target:delStatusEffect(EFFECT_MAGIC_DEF_DOWN);
				target:addStatusEffect(EFFECT_MAGIC_DEF_DOWN,20,0,120*resist);--
			else
				skill:setMsg(MSG_MISS);
			end
		else
			skill:setMsg(MSG_NO_EFFECT);
	end
	return typeEffect;
end;
