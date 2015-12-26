---------------------------------------------
--  Metatron Torment
--
--  Description: Lowers target's defense. Bravura/Abaddon Killer: Temporarily lowers damage taken from enemies. 
--  Type: Physical
--  Range: Melee
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
    
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,3,3,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
    
    local duration = 60;
    local typeEffect = EFFECT_DEFENSE_DOWN;
    local power = 19;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, 0, duration);
    
    target:delHP(dmg);
    return dmg;
    
end;