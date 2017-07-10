---------------------------------------------
-- Slaverous Gale
--
-- Description: Deals earth damage that inflicts Plague and Slow effects on targets in front of the caster
-- Type: Magical (Earth)
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target,mob,skill)
    local typeEffectOne = EFFECT_PLAGUE;
    local typeEffectTwo = EFFECT_SLOW;
    MobStatusEffectMove(mob,target,typeEffectOne,1,3,60);
    MobStatusEffectMove(mob,target,typeEffectTwo,1,3,60);
    local dmgmod = 1; 
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * math.random(4,6),ELE_EARTH,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_EARTH,MOBPARAM_WIPE_SHADOWS);

    target:delHP(dmg);
    return dmg;
end;
