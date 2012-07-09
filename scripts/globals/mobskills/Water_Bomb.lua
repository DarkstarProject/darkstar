---------------------------------------------
--  Water Bomb
--
--  Description: Deals water damage to enemies within area of effect. Additional effect: Silence.
--  Type: Magical (Water)
--  
--  
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)

    power = 1;
    tic = 0;
    duration = 60;

    isEnfeeble = true;
    typeEffect = EFFECT_SILENCE;
    statmod = MOD_INT;
    
    resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.5) then
        if(target:getStatusEffect(typeEffect) == nil) then
            target:addStatusEffect(typeEffect,power,tic,duration);
        end
    end
    dmgmod = 1;
    accmod = 1;
    info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;