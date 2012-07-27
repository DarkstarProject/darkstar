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

    numhits = 1;
    accmod = 1;
    dmgmod = 1;
    info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
	
    return dmg;
end;