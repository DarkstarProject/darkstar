---------------------------------------------
--  Infernal Pestilence
--
--  Description: Releases a horrible disease on targets in front.
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Front arc
--  Notes: Only used by Chahnameed's Stomach.
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local typeEffect = EFFECT_DISEASE;

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 360);

    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*4,ELE_WIND,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
