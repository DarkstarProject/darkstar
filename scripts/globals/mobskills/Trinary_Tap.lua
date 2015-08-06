---------------------------------------------------
-- Trinary Tap
-- Attempts to absorb three buffs from a single target, or otherwise steals HP.
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
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)

    -- try to drain buff
    local effect1 = target:stealStatusEffect();
    local effect2 = target:stealStatusEffect();
    local effect3 = target:stealStatusEffect();
    local dmg = 0;

    if (effect1 ~= nil) then
        local count = 1;

            -- add to myself
            mob:addStatusEffect(effect1:getType(), effect1:getPower(), effect1:getTickCount(), effect1:getDuration());

        if (effect2 ~= nil) then
            count = count + 1;
                -- add to myself
                mob:addStatusEffect(effect2:getType(), effect2:getPower(), effect2:getTickCount(), effect2:getDuration());
        end

        if (effect3 ~= nil) then
            count = count + 1;
                -- add to myself
                mob:addStatusEffect(effect3:getType(), effect3:getPower(), effect3:getTickCount(), effect3:getDuration());
        end
        -- add buff to myself
        skill:setMsg(MSG_EFFECT_DRAINED);

        return count;
    else
        -- time to drain HP. 150-300
        local power = math.random(0, 151) + 150;
        dmg = MobFinalAdjustments(power,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

        target:delHP(dmg);
        mob:addHP(dmg);

        skill:setMsg(MSG_DRAIN_HP);
        return dmg;
    end

end;
