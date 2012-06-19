---------------------------------------------
--  Disseverment
--
--  Description: Delivers a fivefold attack. Additional effect: Poison. Accuracy varies with TP.
--  Type: Physical (Piercing)
--  
--  
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)

    power = (mob:getMainLvl()/15) + math.random(2,4) ;
    tic = 3;
    duration = 60;

    isEnfeeble = true;
    typeEffect = EFFECT_POISON;
    statmod = MOD_INT;
    accrand = math.random(1,2);
    resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.5 and accrand == 1) then
        if(target:getStatusEffect(typeEffect) == nil) then
            target:addStatusEffect(typeEffect,power,tic,duration);
        end
    end

    numhits = 5;
    accmod = 1;
    dmgmod = .3;
    info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_ACC_VARIES,1,2,3);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,info.hitslanded);
    target:delHP(dmg);
    return dmg;
	
end;