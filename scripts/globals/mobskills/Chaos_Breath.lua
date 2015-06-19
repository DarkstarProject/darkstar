---------------------------------------------
--  Chaos Breath
--
--  Description: Deals fire damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Fire)
--
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)

    local dmgmod = MobBreathMove(mob, target, 0.5, 1, ELE_DARK, 700);

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

    target:delHP(dmg);
    return dmg;
end;
