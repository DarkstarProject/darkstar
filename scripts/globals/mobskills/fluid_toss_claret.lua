---------------------------------------------
--  Fluid Toss (Claret)
--  Description: Lobs a ball of liquid at a single target.
--  Type: Ranged
--  Utsusemi/Blink absorb: 1 shadow
--  Range: 15
--  Applies 100hp/tick poison if it hits.
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
    local dmgmod = 4.5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
    target:delHP(dmg);
    
    -- Apply poison if it hits
    MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_POISON, 100, 3, math.random(3,6) * 3);  -- 3-6 ticks
    
    return dmg;
end;
