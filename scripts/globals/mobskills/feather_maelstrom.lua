---------------------------------------------
-- Feather Maelstrom
-- Sends a storm of feathers to a single target.
-- Additional effect: Bio & Amnesia
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = dsp.effects.BIO;
    local typeEffect2 = dsp.effects.AMNESIA;
    local numhits = 1;
    local accmod = 2;
    local dmgmod = 2.8;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,info.hitslanded);
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect1, 6, 3, 60);
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect2, 1, 0, 60);
    target:delHP(dmg);
    return dmg;
end;