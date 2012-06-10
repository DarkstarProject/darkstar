---------------------------------------------
--  Tortoise Stomp
--
--  Description: High damage, area of effect.
--  Type: Physical
--  Utsusemi/Blink absorb:&nbsp;??
--  Range: Varying Area of Effect
--  Notes:
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)
    numhits = 1;
    accmod = 1;
    dmgmod = 1.3;
    info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);
    target:delHP(dmg);
    return dmg;
end;