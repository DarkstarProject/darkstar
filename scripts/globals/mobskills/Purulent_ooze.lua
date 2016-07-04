---------------------------------------------------
--  Purulent Ooze
--  Family: Slugs
--  Description: Deals Water damage in a fan-shaped area of effect. Additional effect: Bio and Max HP Down 
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows 
--  Range: Cone
--  Notes:
---------------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffectOne = EFFECT_BIO;
    local typeEffectTwo = EFFECT_MAX_HP_DOWN;
    local duration = 120;

    MobStatusEffectMove(mob, target, typeEffectOne, 5, 3, duration, FLAG_ERASABLE, 10);
    MobStatusEffectMove(mob, target, typeEffectTwo, 10, 0, duration);

    local dmgmod = 1;
    local baseDamage = mob:getWeaponDmg()*3;
    local info = MobMagicalMove(mob,target,skill,damage,ELE_WATER,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;