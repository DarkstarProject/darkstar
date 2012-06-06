---------------------------------------------
--  Abyss Blast
--
--  Description: Blasts a single target with dark energy. Additional effect: Blind
--  Type: Magical 
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 
--  Notes: Blinds target
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)

    power = 16;
    tic = 0;
    duration = 60;

    isEnfeeble = true;
    typeEffect = EFFECT_BLINDNESS;
    statmod = MOD_INT;
    accrand = math.random(1,2);
    resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.5 and accrand == 1) then
        if(target:getStatusEffect(typeEffect) == nil) then
            target:addStatusEffect(typeEffect,power,tic,duration);
		end
    end
    

    dmgmod = (math.random(1,2)*.6) * mob:getMainLvl() /100;
    accmod = 1;
    info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;