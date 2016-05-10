---------------------------------------------
--  Oblivion Smash
--
--  Description: Deals damage to players within area of effect and inflicts blind, silence, bind, and weight.
--  Type: Physical
--  Utsusemi/Blink absorb:  2-3 shadows
--  Range: Unknown radial
--  Notes:
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    
    local numhits = 3;
    local accmod = 1;
    local dmgmod = 2.5;
    
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,1.5,2);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_BLINDNESS, 20, 0, 120);
    MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_SILENCE, 0 0, 120);
    MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_BIND, 0, 0, 120);
    MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_WEIGHT, 50, 0, 120);
    
    target:delHP(dmg);
    return dmg;
    
end;
