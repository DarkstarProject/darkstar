---------------------------------------------
--  Fiery Blast Alt
--
--  Description: Deals fire damage to a single target
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Notes: Used only by Tiamat, Smok and Ildebrann while flying in place of standard attacks
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)

	local dmgmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_FIRE,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
    skill:setMsg(1);
	return dmg;
end;
