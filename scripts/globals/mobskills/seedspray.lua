---------------------------------------------
-- Seedspray
-- Family: Rafflesia
-- Description: Single-target damage and Defense Down.
-- Type: Physical
-- Utsusemi/Blink absorb: Absorbed by 3 shadows.
-- Range: 11.5 yalms
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 3;
    local accmod = 1;
    local dmgmod = 1;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT,1,1.5,2);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_3_SHADOW);

    MobStatusEffectMove(mob, target, EFFECT_DEFENSE_DOWN, 8, 0, 120);

    target:delHP(dmg);

    return dmg;
end;
