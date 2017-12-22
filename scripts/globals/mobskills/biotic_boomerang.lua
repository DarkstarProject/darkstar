---------------------------------------------
--  Biotic Boomerang
--  Aern (BST & WAR)
--  Blinkable 2-3 hit, addtional effect plague on hit. 
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local numhits = math.random(2,3);
    local accmod = 1;
    local dmgmod = 1;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,0,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,0,info.hitslanded);
    local typeEffect = EFFECT_PLAGUE;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 18, 3, 60);

    target:delHP(dmg);
    return dmg;

end;