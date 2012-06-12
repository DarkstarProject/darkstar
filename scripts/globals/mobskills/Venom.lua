---------------------------------------------
--  Venom
--
--  Description: Deals damage in a fan shaped area. Additional effect: poison
--  Type: Magical Water
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 10' cone
--  Notes: Additional effect can be removed with Poisona.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)

    power = mob:getMainLvl()/8 + 3;
    tic = 3;
    duration = 60;

    isEnfeeble = true;
    typeEffect = EFFECT_POISON;
    statmod = MOD_INT;
    accrand = math.random(1,6);
    resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.3 and accrand ~= 1) then
        if(target:getStatusEffect(typeEffect) == nil) then
            target:addStatusEffect(typeEffect,power,tic,duration);
        end
    end

    dmgmod = .6;
    accmod = 1;
    info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;