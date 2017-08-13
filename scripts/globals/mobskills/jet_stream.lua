---------------------------------------------------
-- Jet Stream
-- Delivers a threefold attack. Accuracy varies with TP.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 3;
    local accmod = 1;
    local dmgmod = 0.9 + (mob:getMainLvl() / 100);
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_ACC_VARIES,1,1.5,2);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
    target:delHP(dmg);
    return dmg;
end;
