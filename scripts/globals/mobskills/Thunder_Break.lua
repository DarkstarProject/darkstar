---------------------------------------------------
-- Thunder Break
-- Channels the power of Thunder toward targets in an area of effect. Additional effect: Stun

---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	if(target:getStatusEffect(EFFECT_STUN) ~= nil) then
		skill:setMsg(MSG_NO_EFFECT);
	else
		isEnfeeble = true;
		typeEffect = EFFECT_STUN;
		statmod = MOD_INT;
		resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
		if(resist > 0.5) then
			target:addStatusEffect(EFFECT_STUN,1,0,5);
		end
	end
	
	dmgmod = 1;
	accmod = 1;
	dmg = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*20,accmod,dmgmod,TP_MAB_BONUS,1);
	target:delHP(dmg);
	return dmg;
	
end