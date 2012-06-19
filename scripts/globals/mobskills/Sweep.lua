---------------------------------------------
--  Sweep
--
--  Description: Damages enemies in an area of effect. Additional effect: Stun
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: 10' radial
--  Notes:
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)

    power = 1;
    tic = 0;
    duration = 5;

    typeEffect = EFFECT_STUN;

    if(target:getStatusEffect(typeEffect) == nil) then
        target:addStatusEffect(typeEffect,power,tic,duration);
    end
    numhits = math.random(2,3);
    accmod = 1;
    dmgmod = .4;
    info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);
    target:delHP(dmg);
    return dmg;
end;