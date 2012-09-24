---------------------------------------------
--  Groundburst
--
--  Description: Expels a fireball on targets in an area of effect.
--  Type: Physical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Unknown radial
--  Notes: Only used by notorious monsters, and from any Mamool Ja in besieged.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	local numhits = 1;
	local accmod = 1;
	local dmgmod = 1;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
