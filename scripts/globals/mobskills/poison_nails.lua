---------------------------------------------------
-- poison_nails

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
    local dmgmod = 2;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,MOBPARAM_WIPE_SHADOWS);

    local typeEffect = dsp.effects.POISON;
    local power = 1;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, 3, 60);

    target:delHP(dmg);
    return dmg;
end;
