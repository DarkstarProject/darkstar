---------------------------------------------
--  Envoutement
--
--  Description: Deals damage to a single target. Additional effect: Curse
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadow
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
    duration = math.random(1,2)*30 + 420;

    typeEffect = EFFECT_CURSE_I;

    if(target:hasStatusEffect(typeEffect) == false) then
        target:addStatusEffect(typeEffect,power,tic,duration);
    end
	
    numhits = 1;
    accmod = 1;
    dmgmod = 1;
    info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);
    target:delHP(dmg);
    return dmg;
end;