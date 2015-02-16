---------------------------------------------
--  Luminous Lance (Minerva's custom version)
--
-- Single target light element damage and stun.
-- Damage increases with distance.
-- Adds custom EnLight effect.
-- 
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local distance = utils.clamp(mob:checkDistance(target), 0, 40);
    local numhits = 1;
    local accmod = 2;
    local dmgmod = 1.4 + (distance * 0.15);
    local info = MobRangedMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_RANGED,MOBPARAM_PIERCE,info.hitslanded);
    mob:addStatusEffect(EFFECT_ENLIGHT, 1, 0, 600);
    target:addStatusEffect(EFFECT_STUN, 0, 0, 20);
    target:delHP(dmg);
    return dmg;
end;