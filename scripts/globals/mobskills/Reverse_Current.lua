---------------------------------------------------
-- Leeching Current
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
	local NM = mob:getID();
	local HP = mob:getHPP();
	
	if (NM == 17662476 or NM == 17662481 or NM == 17662486) and (HP < 50) then
		return 0;
	end
	return 1;
end;

function onMobWeaponSkill(target, mob, skill)
	local dmgmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg(),ELE_DARK,dmgmod,TP_MAB_BONUS,1);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

    if(target:isUndead() == false) then
        target:delHP(dmg);
        mob:addHP(dmg);
        skill:setMsg(MSG_DRAIN_HP);
    else
        skill:setMsg(MSG_NO_EFFECT);
    end
	return dmg;
end;
