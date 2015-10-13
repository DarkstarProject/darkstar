require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
	-- notorious monsters shouldn't explode, nor dynamis
    if (mob:isMobType(MOBTYPE_NOTORIOUS) or mob:isInDynamis()) then
    	return 1;
    end
    if (mob:getMainJob() ~= JOB_THF and math.random() < 0.5) then
    	return 1;
    end
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local dmgmod = 1;
        local BOMB_TOSS_HPP = mob:getHP()/mob:getMaxHP();

        local job = mob:getMainJob();
	local power = math.random(10,15);

	-- did I drop it in my face?
	if (math.random() < 0.2) then
		power = 7;
	end

	-- thfs drop bombs like crazy
	if (job == JOB_THF) then
		power = power + 4;
	end

	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*power*BOMB_TOSS_HPP,ELE_FIRE,dmgmod,TP_MAB_BONUS,1);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);
	mob:setHP(0);
	target:delHP(dmg);
	return dmg;
end;
