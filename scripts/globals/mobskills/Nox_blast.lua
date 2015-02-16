---------------------------------------------------
-- Nox Blast
-- A dark blast hits targets in front. Additional effect: Knockback and resets TP
-- Range: 15' cone
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:AnimationSub() == 0) then
		return 1;
	else	
	return 0;
	end
end;

function onMobWeaponSkill(target, mob, skill)
    
	local power = (mob:getMainLvl()/2 *0.6 + 10);
	local dmgmod = 2;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*5,ELE_ICE,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_ICE,MOBPARAM_IGNORE_SHADOWS);
	local reset = 0;
    if(target:getTP() == 0) then
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    else
        target:setTP(reset);
        
    end
	target:delHP(dmg);
	return dmg;
	
end;
