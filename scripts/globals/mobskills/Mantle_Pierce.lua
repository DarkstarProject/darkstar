---------------------------------------------
--  Mantle Pierce
--
--  Description: Stabs a single target. Additional effect: Weight
--  Type: Physical
--  Utsusemi/Blink absorb: 1-3 shadow(s)
--  Range: Melee
--  Notes:
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)

    power = 1;
    tic = 0;
    duration = 300;

    isEnfeeble = true;
    typeEffect = EFFECT_WEIGHT;
    statmod = MOD_INT;
    
    resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.5) then
        if(target:getStatusEffect(typeEffect) == nil) then
            target:addStatusEffect(typeEffect,power,tic,duration);
        end
    end
	
    numhits = 1;
    accmod = 2;
    dmgmod = 3;
    info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_3_SHADOW);
    target:delHP(dmg);
    return dmg;
	
end;