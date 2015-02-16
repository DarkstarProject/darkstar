---------------------------------------------
-- Medusa Javelin (Minerva's custom version)
--
-- Single target physical damage and petrify.
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
    local numhits = 1;
    local accmod = 2;
    local dmgmod = 1.9;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
    MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_PETRIFICATION, 1, 0, 45);
    target:delHP(dmg);
    return dmg;
end;