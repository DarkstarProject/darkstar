---------------------------------------------
--  Grim Reaper
--
--  Description: Deals damage in a threefold attack to targets in a fan-shaped area of effect. Additional effect: Doom
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: Unknown cone
--  Notes: Used only by certain Lamia NMs (e.g. Lamia No.3). If they lost their staff, they'll use Hysteric Barrage instead.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)

    power = 1;
    tic = 0;
    duration = 60;
--[[
    isEnfeeble = true;
    typeEffect = EFFECT_POISON;
    statmod = MOD_INT;
    
    resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.5) then
        if(target:getStatusEffect(typeEffect) == nil) then
            target:addStatusEffect(typeEffect,power,tic,duration);
        end
    end
	]]
    numhits = 3;
    accmod = 1;
    dmgmod = 1;
    info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_3_SHADOW);
    target:delHP(dmg);
	
    return dmg;
end;