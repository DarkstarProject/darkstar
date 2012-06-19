---------------------------------------------
--  Heavy Stomp
--
--  Description: Deals heavy damage to targets within an area of effect. Additional effect: Paralysis
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: Unknown radial
--  Notes: Paralysis effect has a very long duration.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)

    power = 8;
    tic = 3;
    duration = 60;

    isEnfeeble = true;
    typeEffect = EFFECT_PARALYSIS;
    statmod = MOD_INT;
    accrand = math.random(1,2);
    resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.5 and accrand == 1) then
        if(target:getStatusEffect(typeEffect) == nil) then
            target:addStatusEffect(typeEffect,power,tic,duration);
        end
    end
    numhits = math.random(2,3);
    accmod = 1;
    dmgmod = .3;
    info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);
    target:delHP(dmg);
    return dmg;
end;