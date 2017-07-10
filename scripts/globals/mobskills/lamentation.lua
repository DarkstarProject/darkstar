---------------------------------------------
-- Lamentation
--
-- Description: Deals Light damage to all targets in range. Additional effect: Dia
-- Range: 10' cone
-- Wipes Shadows
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_DIA;

    MobStatusEffectMove(mob, target, typeEffect, 3, 3, 60);

    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_LIGHT,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_LIGHT,MOBPARAM_WIPE_SHADOWS);

    target:delHP(dmg);
    return dmg;
end;
