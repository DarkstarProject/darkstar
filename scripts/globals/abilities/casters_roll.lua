-----------------------------------
-- Ability: Caster's Roll
-- Enhances "Fast Cast" effect for party members within area of effect. 
-- Optimal Job: None
-- Lucky Number: 2
-- Unlucky Number: 7
-- Level: 79
-- Phantom Roll +1 Value: 3
--
-- Die Roll    | Fast Cast%   
-- --------    -------  
-- 1           |+6
-- 2           |+15     
-- 3           |+7     
-- 4           |+8     
-- 5           |+9     
-- 6           |+10     
-- 7           |+5     
-- 8           |+11      
-- 9           |+12    
-- 10          |+13     
-- 11          |+20     
-- Bust        |-10    
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/ability");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    local effectID = dsp.effects.CASTERS_ROLL
    ability:setRange(ability:getRange() + player:getMod(MOD_ROLL_RANGE));
    if (player:hasStatusEffect(effectID)) then
        return msgBasic.ROLL_ALREADY_ACTIVE,0;
    elseif atMaxCorsairBusts(player) then
        return msgBasic.CANNOT_PERFORM,0;
    else
        return 0,0;
    end
end;

function onUseAbility(caster,target,ability,action)
    if (caster:getID() == target:getID()) then
        corsairSetup(caster, ability, action, dsp.effects.CASTERS_ROLL, dsp.jobs.COR);
    end
    local total = caster:getLocalVar("corsairRollTotal")
    return applyRoll(caster,target,ability,action,total)
end;

function applyRoll(caster,target,ability,action,total)
    local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK) + caster:getMod(MOD_PHANTOM_DURATION)
    local effectpowers = {6, 15, 7, 8, 9, 10, 5, 11, 12, 13, 20, -10}
    local effectpower = effectpowers[total];
-- Apply Buffs from Caster's Roll Enhancing Gear if present
    if (math.random(0, 99) < caster:getMod(MOD_ENHANCES_CASTERS_ROLL)) then
        effectpower = effectpower + 10
    end
-- Apply Additional Phantom Roll+ Buff
    local phantomBase = 3; -- Base increment buff
    local effectpower = effectpower + (phantomBase * phantombuffMultiple(caster))
-- Check if COR Main or Sub
    if (caster:getMainJob() == dsp.jobs.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == dsp.jobs.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), dsp.effects.CASTERS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_FASTCAST) == false) then
        ability:setMsg(msgBasic.ROLL_MAIN_FAIL);
    elseif total > 11 then
        ability:setMsg(msgBasic.DOUBLEUP_BUST);
    end
    return total;
end
