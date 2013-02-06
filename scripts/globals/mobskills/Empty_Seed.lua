---------------------------------------------
--  Empty Seed
--
--  Description: Deals physical damage to enemies within area of effect.
--  Type: Physical
--  Utsusemi/Blink absorb: 1-3 shadows
--  Range: 20' radial
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    -- Add knock back!
    local numhits = math.random(2,3);
    local accmod = 1;
    local dmgmod = 0.6;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);
    target:delHP(dmg);
    return dmg;
end;
