---------------------------------------------
--  Mobskill: Nox Blast
--
--  Description: A dark blast hits targets
--  in front. Additional effect: knockback
--  and resets TP
--  
--  Type: Magical
--  Can be dispelled N/A
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Unknown cone 
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;


function OnMobWeaponSkill(target, mob, skill)
	target:dispelStatusEffect();

	local dmgmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.5,ELE_DARK,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);

	return dmg;
end;