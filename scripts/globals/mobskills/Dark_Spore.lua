---------------------------------------------
--  Dark Spore
--
--  Description: Unleashes a torrent of black spores in a fan-shaped area of effect, dealing dark damage to targets. Additional effect: Blind
--  Type: Magical Dark (Element)
--
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_BLINDNESS;
    MobStatusEffectMove(mob, target, typeEffect, 15, 3, 120);

    local dmgmod = MobBreathMove(mob, target, 0.25, 2, ELE_DARK, 800);

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

    target:delHP(dmg);
    return dmg;
end;
