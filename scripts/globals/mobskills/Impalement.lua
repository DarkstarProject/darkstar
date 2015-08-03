---------------------------------------------
--  Impalement
--
--  Description: Deals damage to a single target reducing their HP to 5%. Resets enmity.
--  Type: Physical
--  Utsusemi/Blink absorb: No
--  Range: Single Target
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    if (mob:isMobType(MOBTYPE_NOTORIOUS)) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)

    target:addStatusEffect(EFFECT_SLOW,128,0,120);

    local currentHP = target:getHP();
    -- remove all by 5%
    local stab = currentHP * .95;

    local dmg = MobFinalAdjustments(stab,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,MOBPARAM_IGNORE_SHADOWS);

    target:delHP(dmg);

    mob:resetEnmity(target);
    return dmg;
end;
