---------------------------------------------
--  Glacial Breath
--
--  Description: Deals Ice damage to enemies within a fan-shaped area.
--  Type: Breath
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
--  Notes: Used only by Jormungand and Isgebind
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/utils");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:hasStatusEffect(EFFECT_BLOOD_WEAPON)) then
        return 1;
    elseif (target:isBehind(mob, 48) == true) then
        return 1;
    elseif (mob:AnimationSub() == 1) then
        return 1;
    end

    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = MobBreathMove(mob, target, 0.2, 1.25, ELE_ICE, 1400);
    local angle = mob:getAngle(target);

    angle = mob:getRotPos() - angle;
    dmgmod = dmgmod * ((128-math.abs(angle))/128);
    dmgmod = utils.clamp(dmgmod, 50, 1600);

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_ICE,MOBPARAM_IGNORE_SHADOWS);

    target:delHP(dmg);
    return dmg;
end;