---------------------------------------------
--  Pandemic Nip
--
--  Description: Single target damage and transfers up to five current enfeebles to target player.
--  Type: Physical?
--  Utsusemi/Blink absorb: 1 shadow?
--  Range: Melee
--  Notes: Transfers debuffs to the target player (maximum 5). Includes Dancer's Quickstep's Evasion Down and Box Step's Defense Down.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
    
	numhits = 1;
    accmod = 2;
    dmgmod = 3;
    info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_1_SHADOW);
    target:delHP(dmg);
    return dmg;
	
end;