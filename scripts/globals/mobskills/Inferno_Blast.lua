---------------------------------------------
--  Fiery Blast
--
--  Description: Deals fire damage to enemies in area of effect.
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 18' radial.
--  Notes: Used only by Tiamat, Smok and Ildebrann while flying.
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    if (mob:AnimationSub() ~= 1) then
        return 1;
    end
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)

	local dmgmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*8,ELE_FIRE,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
