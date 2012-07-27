---------------------------------------------
--  Head Snatch
--
--  Description: Grabs a single target's head.
--  Type: Physical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Melee
--  Notes: Only used by Gurfurlur the Menacing. Reduces HP to 10%.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)

    numhits = 1;
    accmod = 1;
    dmgmod = 2;
    info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
	
    return dmg;
end;