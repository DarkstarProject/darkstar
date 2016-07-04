---------------------------------------------
--  Hammer-Go-Round
--
--  Description: Damages nearby targets with a hammer carousel. Additional effect: Knockback
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadow
--  Range: Melee
--  Notes: Only used by "destroyers" (carrying massive warhammers).
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    -- KNOCKBACK

    local numhits = math.random(2,3);
    local accmod = 1;
    local dmgmod = 1;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
    target:delHP(dmg);
    return dmg;
end;
