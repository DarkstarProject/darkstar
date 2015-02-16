---------------------------------------------
--
-- Light Blade (Minerva's custom version)
--
-- Single target light element damage.
-- Deal greater damage at close range.
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
    local numhits = 1;
    local accmod = 2;
    local dmgmod = 2.1;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_RANGED,MOBPARAM_SLASH,info.hitslanded);
    local distance = mob:checkDistance(target)
    utils.clamp(distance, 0, 40)
    dmg = dmg * ((50 - distance) / 50);
    mob:addStatusEffect(EFFECT_ENLIGHT, 1, 0, 600);
    target:delHP(dmg);
    return dmg;
end;
