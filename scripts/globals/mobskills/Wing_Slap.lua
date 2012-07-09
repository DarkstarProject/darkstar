---------------------------------------------
--  Wing Slap
--
--  Description: Slaps around a single target four times with its wings. Additional effect: Stun
--  Type: Physical
--  Utsusemi/Blink absorb: 4 shadows
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
    duration = 5;

    isEnfeeble = true;
    typeEffect = EFFECT_STUN;
    statmod = MOD_INT;
    resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.5) then
        if(target:getStatusEffect(typeEffect) == nil) then
            target:addStatusEffect(typeEffect,power,tic,duration);
        end
    end
	
    numhits = 4;
    accmod = 1;
    dmgmod = 0.6;
    info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);
    target:delHP(dmg);
	
    return dmg;
end;