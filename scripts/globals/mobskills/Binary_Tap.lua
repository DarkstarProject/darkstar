---------------------------------------------------
-- Binary Tap
-- Attempts to absorb two buffs from a single target, or otherwise steals HP.
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
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    -- try to drain buff
    local effectFirst = target:stealStatusEffect();
    local effectSecond = target:stealStatusEffect();
    local dmg = 0;

    if(effectFirst ~= nil) then

        local count = 1;

            -- add to myself
        mob:addStatusEffect(effectFirst:getType(), effectFirst:getPower(), effectFirst:getTickCount(), effectFirst:getDuration());

        if(effectSecond ~= nil) then
            count = count + 1;
                -- add to myself
            mob:addStatusEffect(effectSecond:getType(), effectSecond:getPower(), effectSecond:getTickCount(), effectSecond:getDuration());

        end


        -- add buff to myself
        skill:setMsg(MSG_EFFECT_DRAINED);

        return count;
    else
        -- time to drain HP. 100-200
        local power = math.random(0, 101) + 100;
        dmg = MobFinalAdjustments(power,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

        target:delHP(dmg);
        mob:addHP(dmg);

        skill:setMsg(MSG_DRAIN_HP);
        return dmg;
    end

end;
