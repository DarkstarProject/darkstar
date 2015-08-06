---------------------------------------------------
-- Spirit Tap
-- Attempts to absorb one buff from a single target, or otherwise steals HP.
-- Type: Magical
-- Utsusemi/Blink absorb: Ignores Shadows
-- Range: Melee
-- Notes: Can be any (positive) buff, including food. Will drain about 100HP if it can't take any buffs
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:isMobType(MOBTYPE_NOTORIOUS)) then
        return 1;
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    -- try to drain buff
    local effect = target:stealStatusEffect();
    local dmg = 0;

    if (effect ~= nil) then
            -- add to myself
            mob:addStatusEffect(effect:getType(), effect:getPower(), effect:getTickCount(), effect:getDuration());
        -- add buff to myself
        skill:setMsg(MSG_EFFECT_DRAINED);

        return 1;
    else
        -- time to drain HP. 50-100
        local power = math.random(0, 51) + 50;
        dmg = MobFinalAdjustments(power,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

        target:delHP(dmg);
        mob:addHP(dmg);

        skill:setMsg(MSG_DRAIN_HP);
    end

    return dmg;
end;
