---------------------------------------------
--  Vampiric Lash
--
--  Description: Deals dark damage to a single target. Additional effect: Drain
--  Type: Magical
--  Utsusemi/Blink absorb: 1 shadow
--  Range: Melee
--  Notes: In ToAU zones, this has an additional effect of absorbing all status effects, including food.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)

    dmgmod = 1;
    accmod = 1;
    info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_1_SHADOW);
    target:delHP(dmg);
    target:addHP(dmg);
    return dmg;
end;