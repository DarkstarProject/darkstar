---------------------------------------------------
--  Fuscous Ooze
--  Family: Slugs
--  Description: A dusky slime inflicts encumberance and weight.
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows 
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
    -- TODO: Encumberance seems to do nothing?
    local typeEffect = EFFECT_WEIGHT;
    local duration = 45;

    MobStatusEffectMove(mob, target, typeEffect, 50, 0, duration);

    local dmgmod = 1;
    local baseDamage = mob:getWeaponDmg()*3.7;
    local info = MobMagicalMove(mob,target,skill,baseDamage,ELE_WATER,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;