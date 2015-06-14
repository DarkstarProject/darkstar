---------------------------------------------------
-- Self-Destruct
--
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if(mob:isMobType(MOBTYPE_NOTORIOUS) or mob:getHPP() > 75) then
    	return 1;
    end
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local dmgmod = 1;
	if(mob:getHP()~=0) then
		BOMB_TOSS_HPP = mob:getHP()/mob:getMaxHP();
	end

	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*18*BOMB_TOSS_HPP,ELE_FIRE,dmgmod,TP_MAB_BONUS,1);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);
	mob:setHP(0);
	target:delHP(dmg);
	return dmg;
end