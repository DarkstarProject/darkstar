---------------------------------------------
--  Fevered Pitch
--  Deals damage to a single target. Additional effect: Stun and Defense Down
--  Utsusemi/Blink absorb: 1 shadow
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
    local accmod = 1;
    local dmgmod = 2.5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    MobPhysicalStatusEffectMove(mob, target, skill, dsp.effects.DEFENSE_DOWN, 30, 0, 120);

    MobPhysicalStatusEffectMove(mob, target, skill, dsp.effects.STUN, 1, 0, 4);

    target:delHP(dmg);
    return dmg;
end;
