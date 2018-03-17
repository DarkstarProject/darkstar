-----------------------------------
-- Ability: Courser's Roll
-- Enhances "Snapshot" effect for party members within area of effect. 
-- Optimal Job: None
-- Lucky Number: 3
-- Unlucky Number: 9
-- Level: 81
-- Phantom Roll +1 Value: 1
--
-- No Reliable Community Data available. Numbers Based on Blitzer's Roll Values.
--
-- Die Roll    | Snapshot+   
-- --------    -------  
-- 1           |+2
-- 2           |+3     
-- 3           |+11     
-- 4           |+4     
-- 5           |+5     
-- 6           |+6     
-- 7           |+7     
-- 8           |+8      
-- 9           |+1    
-- 10          |+10     
-- 11          |+12     
-- Bust        |-5    
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/ability");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    local effectID = EFFECT_COURSERS_ROLL
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
        corsairSetup(caster, ability, action, EFFECT_COURSERS_ROLL, JOBS.COR);
    end
    local total = caster:getLocalVar("corsairRollTotal")
    return applyRoll(caster,target,ability,action,total)
end;

function applyRoll(caster,target,ability,action,total)
    local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK) + caster:getMod(MOD_PHANTOM_DURATION)
    local effectpowers = {2, 3, 11, 4, 5, 6, 7, 8, 1, 10, 12, -5}
    local effectpower = effectpowers[total];
-- Apply Buffs from Courser's Roll Enhancing Gear if present
    if (math.random(0, 99) < caster:getMod(MOD_ENHANCES_COURSERS_ROLL)) then
        effectpower = effectpower + 3
    end
-- Apply Additional Phantom Roll+ Buff
    local phantomBase = 1; -- Base increment buff
    local effectpower = effectpower + (phantomBase * phantombuffMultiple(caster))
-- Check if COR Main or Sub
    if (caster:getMainJob() == JOBS.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOBS.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_COURSERS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_SNAPSHOT) == false) then
        ability:setMsg(msgBasic.ROLL_MAIN_FAIL);
    elseif total > 11 then
        ability:setMsg(msgBasic.DOUBLEUP_BUST);
    end
    return total;
end
