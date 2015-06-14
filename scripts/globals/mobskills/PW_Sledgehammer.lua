---------------------------------------------
-- Sledgehammer
--
-- Description: Delivers a sledgehammer blow to all targets in front. Additional effect: Petrification
-- Type: Physical
-- Utsusemi/Blink absorb: 3 shadows
-- Range: Front cone
-- Notes: Only used by Gurfurlur the Menacing.
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local mobSkin = mob:getModelId();

    if (mobSkin == 1867) then
        return 0;
    else
        return 1;
    end
end;

function onMobWeaponSkill(target, mob, skill)

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 3.2;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,3 * info.hitslanded);

    local typeEffect = EFFECT_PETRIFICATION;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 30);

    target:delHP(dmg);

    return dmg;
end;