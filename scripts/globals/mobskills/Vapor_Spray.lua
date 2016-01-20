---------------------------------------------
--  Vapor Spray
--
--  Description: Deals Water breath damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Water)
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
    local dmgmod = MobBreathMove(mob, target, 0.3, 0.75, ELE_WATER, 600);

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_WATER, MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
