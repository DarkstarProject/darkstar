---------------------------------------------
-- Hexa Strike
--
-- Description: Delivers a sixfold attack. Chance of critical hit varies with TP.
-- Type: Physical
-- Utsusemi/Blink absorb: Shadow per hit
-- Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    mob:messageBasic(43, 0, 168);
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 6;
    local accmod = 1;
    local dmgmod = 1.0;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_CRIT_VARIES,1.1,1.2,1.3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);

    skill:setSkillchain(168);

    target:delHP(dmg);
    return dmg;
end;
