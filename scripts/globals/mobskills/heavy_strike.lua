---------------------------------------------------
-- Heavy Strike
-- Damage varies with TP.
-- 0% TP: 2.25 / 150% TP: 3.50 / 300% TP: 4.75
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.7;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    local typeEffect = dsp.effects.SLOW;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 128, 0, 120);

    target:delHP(dmg);
    return dmg;
end;
