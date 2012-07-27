---------------------------------------------
--  Hammer-Go-Round
--
--  Description: Damages nearby targets with a hammer carousel. Additional effect: Knockback
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadow
--  Range: Melee
--  Notes: Only used by "destroyers" (carrying massive warhammers).
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)
	
    -- KNOCKBACK

    numhits = 1;
    accmod = 1;
    dmgmod = 1;
    info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_3_SHADOW);
    target:delHP(dmg);
	
    return dmg;
end;