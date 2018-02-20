---------------------------------------------------
-- Purulent Ooze
-- Family: Slugs
-- Description: Deals Water damage in a fan-shaped area of effect. Additional effect: Bio and Max HP Down
-- Type: Magical
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: Cone
-- Notes:
---------------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1;
    local baseDamage = mob:getWeaponDmg()*3;
    local info = MobMagicalMove(mob,target,skill,baseDamage,ELE_WATER,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_WIPE_SHADOWS);

    MobStatusEffectMove(mob, target, EFFECT_BIO, 5, 3, 120, FLAG_ERASABLE, 10);
    MobStatusEffectMove(mob, target, EFFECT_MAX_HP_DOWN, 10, 0, 120);

    target:delHP(dmg);
    return dmg;
end;
