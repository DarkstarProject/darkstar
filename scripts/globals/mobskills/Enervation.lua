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

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_DEFENSE_DOWN;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,4);
		if(resist > 0.5) then
			skill:setMsg(MSG_ENFEEB_IS);
			target:addStatusEffect(typeEffect,20,0,120);--power=20;tic=0;duration=120;
			if(target:hasStatusEffect(EFFECT_MAGIC_DEF_DOWN) == false) then
				target:addStatusEffect(EFFECT_MAGIC_DEF_DOWN,20,0,120);--power=20;tic=0;duration=120;
			end
		else
			skill:setMsg(MSG_MISS);
		end
	else
		skill:setMsg(MSG_NO_EFFECT);
	end
	return typeEffect;
end;
