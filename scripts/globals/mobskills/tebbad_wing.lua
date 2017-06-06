---------------------------------------------
--  Tebbad Wing
--
--  Description: A hot wind deals Fire damage to enemies within a very wide area of effect. Additional effect: Plague
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 30' radial.
--  Notes: Used only by Tiamat, Smok and Ildebrann
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    if (mob:hasStatusEffect(EFFECT_MIGHTY_STRIKES)) then
        return 1;
    elseif (mob:AnimationSub() == 1) then
        return 1;
    elseif (target:isBehind(mob, 48) == true) then
        return 1;
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_PLAGUE;

    MobStatusEffectMove(mob, target, typeEffect, 10, 0, 120);

    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*5,ELE_FIRE,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
