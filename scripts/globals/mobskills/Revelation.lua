---------------------------------------------
--  Revelation
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
require("/scripts/zones/Empyreal_Paradox/TextIDs");
---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    local lanceTime, lanceOut, rejuv = mob:getExtraVar(3);
    if (target:getFamily() == 478 and lanceOut == 0) then
        return 0;
    else
        return 1;
    end
end;

function OnMobWeaponSkill(target, mob, skill)

	local dmgmod = 1.5;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg(),ELE_LIGHT,dmgmod,TP_MAB_BONUS,1);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_LIGHT,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
