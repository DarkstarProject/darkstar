---------------------------------------------------
-- Trinary Tap
-- Attempts to absorb three buffs from a single target, or otherwise steals HP.
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
    if(mob:isMobType(MOBTYPE_NOTORIOUS)) then
        return 0;
    end
    return 1;
end;

function OnMobWeaponSkill(target, mob, skill)

    -- try to drain buff
    local effect1 = target:drainStatusEffect();
    local effect2 = target:drainStatusEffect();
    local effect3 = target:drainStatusEffect();

    if(effect1 == nil) then
        -- time to drain HP. 150-300
        local power = math.random(0, 151) + 150;
        local dmg = MobFinalAdjustments(power,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

        target:delHP(dmg);
        mob:addHP(dmg);
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

        if(effect3 ~= nil and mob:hasStatusEffect(effect3:getType()) == false) then
            count = count + 1;
            -- add to myself
            mob:addStatusEffect(effect3:getType(), effect3:getPower(), effect3:getTickCount(), effect3:getDuration());
        end
        -- add buff to myself
        skill:setMsg(MSG_EFFECT_DRAINED);
        return count;
    end

    return dmg;
end;
