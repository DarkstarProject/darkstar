---------------------------------------------------
-- Binary Tap
-- Attempts to absorb two buffs from a single target, or otherwise steals HP.
-- Type: Magical
-- Utsusemi/Blink absorb: Ignores Shadows
-- Range: Melee
-- Notes: Can be any (positive) buff, including food. Will drain about 100HP if it can't take any buffs
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

    -- try to drain buff
    local effect1 = target:drainStatusEffect();
    local effect2 = target:drainStatusEffect();

    if(effect1 == nil) then
        -- time to drain HP. 100-200
        local power = math.random(0, 101) + 100;
        local dmg = MobFinalAdjustments(power,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

        target:delHP(dmg);
        mob:addHP(dmg);

        return dmg;
    else
        local count = 1;

        if(mob:hasStatusEffect(effect1:getType()) == false) then
            -- add to myself
            mob:addStatusEffect(effect1:getType(), effect1:getPower(), effect1:getTickCount(), effect1:getDuration());
        end

        if(effect2 ~= nil and mob:hasStatusEffect(effect2:getType()) == false) then
            count = count + 1;
            -- add to myself
            mob:addStatusEffect(effect2:getType(), effect2:getPower(), effect2:getTickCount(), effect2:getDuration());
        end
        -- add buff to myself
        skill:setMsg(MSG_EFFECT_DRAINED);
        return count;
    end

    return dmg;
end;
