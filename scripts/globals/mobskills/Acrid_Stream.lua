---------------------------------------------
--  Acrid Stream
--
--  Description: Deals water damage to enemies within a fan-shaped area originating from the caster. Additional effect: Lowers target's Magic Defense.
--  Type: Magical (Water)
--  
--  
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)

    power = 20;
    tic = 0;
    duration = 60;

    isEnfeeble = true;
    typeEffect = EFFECT_MAGIC_DEF_DOWN;
    statmod = MOD_INT;
    accrand = math.random(1,3);
    resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.5 and accrand ~= 1) then
        if(target:getStatusEffect(typeEffect) == nil) then
            target:addStatusEffect(typeEffect,power,tic,duration);
        end
    end
    dmgmod = 1;
    accmod = 1;
    info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*1.5,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;