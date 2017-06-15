---------------------------------------------------
-- Absolute Terror
-- Causes Terror, which causes the victim to be stunned for the duration of the effect, this can not be removed.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:hasStatusEffect(EFFECT_MIGHTY_STRIKES)) then
        return 1;
    elseif (mob:hasStatusEffect(EFFECT_SUPER_BUFF)) then
        return 1;
    elseif (mob:hasStatusEffect(EFFECT_INVINCIBLE)) then
        return 1;
    elseif (mob:hasStatusEffect(EFFECT_BLOOD_WEAPON)) then
        return 1;
    elseif (target:isBehind(mob, 48) == true) then
        return 1;
    elseif (mob:AnimationSub() == 1) then
        return 1;
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local typeEffect = EFFECT_TERROR;
    local power = 30;
    -- Three minutes is WAY too long, especially on Wyrms. Reduced to Wiki's definition of 'long time'. Reference: http://wiki.ffxiclopedia.org/wiki/Absolute_Terror
    local duration = 30;
    if (skill:isAoE()) then
        duration = 10;
    end;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, duration));
    return typeEffect;

end
