-----------------------------------
-- Ability: Double Up
-- Enhances an active Phantom Roll effect that is eligible for Double-Up.
-- Obtained: Corsair Level 5
-- Recast Time: 8 seconds
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/ability");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    ability:setRange(ability:getRange() + player:getMod(MOD_ROLL_RANGE));
    if (not player:hasStatusEffect(dsp.effects.DOUBLE_UP_CHANCE)) then
        return msgBasic.NO_ELIGIBLE_ROLL,0;
    else
        return 0,0;
    end
end;

function onUseAbility(caster,target,ability,action)
    if (caster:getID() == target:getID()) then
        local du_effect = caster:getStatusEffect(dsp.effects.DOUBLE_UP_CHANCE);
        local prev_roll = caster:getStatusEffect(du_effect:getSubPower());
        local roll = prev_roll:getSubPower();
        local job = du_effect:getTier()
        caster:setLocalVar("corsairActiveRoll", du_effect:getSubType())
        local snake_eye = caster:getStatusEffect(dsp.effects.SNAKE_EYE);
        if (snake_eye) then
            if (prev_roll:getPower() > 5 and math.random(100) < snake_eye:getPower()) then
                roll = 11
            else
                roll = roll + 1
            end
            caster:delStatusEffect(dsp.effects.SNAKE_EYE)
        else
            roll = roll + math.random(1,6)
            if (roll > 12) then
                roll = 12
                caster:delStatusEffectSilent(dsp.effects.DOUBLE_UP_CHANCE)
            end
        end
        if (roll == 11) then
            caster:resetRecast(RECAST_ABILITY, 193)
        end
        caster:setLocalVar("corsairRollTotal", roll)
        action:speceffect(caster:getID(),roll-prev_roll:getSubPower())
        checkForJobBonus(caster, job)
    end
    local total = caster:getLocalVar("corsairRollTotal")
    local prev_ability = getAbility(caster:getLocalVar("corsairActiveRoll"));
    if (prev_ability) then
        action:animation(target:getID(),prev_ability:getAnimation());
        action:actionID(prev_ability:getID()+16)
        dofile("scripts/globals/abilities/"..prev_ability:getName()..".lua");
        local total = applyRoll(caster,target,ability,action,total)
        local msg = ability:getMsg()
        if msg == 420 then
            ability:setMsg(msgBasic.DOUBLEUP)
        elseif msg == 422 then
            ability:setMsg(msgBasic.DOUBLEUP_FAIL)
        end
        return total;
    end
end;
