---------------------------------------------------
-- Ice Break
-- Deals ice damage to enemies within range. Additional Effect: "Bind."
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	if(target:getStatusEffect(EFFECT_BIND) ~= nil) then
		skill:setMsg(MSG_NO_EFFECT);
	else
		isEnfeeble = true;
		typeEffect = EFFECT_BIND;
		statmod = MOD_INT;
		resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
		if(resist > 0.5) then
			target:addStatusEffect(EFFECT_BIND,1,0,60);
		end
	end
	
	dmgmod = 1;
	accmod = 1;
	dmg = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*20,accmod,dmgmod,TP_MAB_BONUS,1);
	target:delHP(dmg);
	return dmg;
	
end