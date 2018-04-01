-----------------------------------
-- Ability: Runeist's Roll
-- Enhances magic evasion for party members within area of effect. 
-- Optimal Job: Rune Fencer
-- Lucky Number: 4
-- Unlucky Number: 8
-- Level: 70
-- Phantom Roll +1 Value: 2
--
-- Die Roll    | MEVA+   
-- --------    -------  
-- 1           |+4     
-- 2           |+6     
-- 3           |+8     
-- 4           |+25     
-- 5           |+10    
-- 6           |+12     
-- 7           |+14    
-- 8           |+2     
-- 9           |+17     
-- 10          |+20     
-- 11          |+30     
-- Bust        |-10    
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/ability");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    local effectID = EFFECT_RUNEISTS_ROLL
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
        corsairSetup(caster, ability, action, EFFECT_RUNEISTS_ROLL, JOBS.RUN);
    end
    local total = caster:getLocalVar("corsairRollTotal")
    return applyRoll(caster,target,ability,action,total)
end;

function applyRoll(caster,target,ability,action,total)
    local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK) + caster:getMod(MOD_PHANTOM_DURATION)
    local effectpowers = {4, 6, 8, 25, 10, 12, 14, 2, 17, 20, 30, -10}
    local effectpower = effectpowers[total];
    if (caster:getLocalVar("corsairRollBonus") == 1 and total < 12) then -- TODO Add logic for Phantom Roll +
        effectpower = effectpower + 7
    end
-- Apply Additional Phantom Roll+ Buff
    local phantomBase = 2; -- Base increment buff
    local effectpower = effectpower + (phantomBase * phantombuffMultiple(caster))
-- Check if COR Main or Sub
    if (caster:getMainJob() == JOBS.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOBS.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_RUNEISTS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_MEVA) == false) then
        ability:setMsg(msgBasic.ROLL_MAIN_FAIL);
    elseif total > 11 then
        ability:setMsg(msgBasic.DOUBLEUP_BUST);
    end
    return total;
end

