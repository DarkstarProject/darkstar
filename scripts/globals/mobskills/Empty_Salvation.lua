---------------------------------------------
--  Empty Salvation
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    target:dispelStatusEffect(EFFECTFLAG_DISPELABLE);
    target:dispelStatusEffect(EFFECTFLAG_DISPELABLE);
    target:dispelStatusEffect(EFFECTFLAG_DISPELABLE);

	local dmgmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 2,ELE_DARK,dmgmod,TP_MAB_BONUS,1);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_3_SHADOW);
	target:delHP(dmg);
	return dmg;
end;
