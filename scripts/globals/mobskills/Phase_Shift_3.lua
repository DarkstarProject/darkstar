---------------------------------------------------
-- Phase Shift
-- A shockwave deals damage to targets in an area of effect. Additional effect: Stun + Bind
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1;
    local accmod = 1;
    local dmgmod = 7;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,4,4,4);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_2_SHADOW);
    MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_STUN, 1, 0, 15);
    MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_BIND, 1, 0, 30);
    target:delHP(dmg);
    mob:setUnkillable(false);
    return dmg;
end;
