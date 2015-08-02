---------------------------------------------
--  Revelation
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/zones/Empyreal_Paradox/TextIDs");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    if (target:getFamily() == 478 and mob:getLocalVar("lanceOut") == 0) then
        return 0;
    else
        return 1;
    end
end;

function onMobWeaponSkill(target, mob, skill)

	local dmgmod = 1.5;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg(),ELE_LIGHT,dmgmod,TP_MAB_BONUS,1);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_LIGHT,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
