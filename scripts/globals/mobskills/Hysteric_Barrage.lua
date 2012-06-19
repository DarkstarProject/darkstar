---------------------------------------------
--  Hysteric Barrage
--
--  Description: Delivers a fivefold attack. Damage varies with TP.
--  Type: Physical (Hand-to-Hand)
--  
--  
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)
    numhits = 5;
    accmod = 1;
    dmgmod = .2;
    info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_H2H,info.hitslanded);
    target:delHP(dmg);
    return dmg;
end;