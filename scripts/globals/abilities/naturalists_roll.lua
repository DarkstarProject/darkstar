-----------------------------------
-- Ability: Naturalists's Roll
-- Increases the duration of enhancing magic effects received for party members within area of effect.
-- Optimal Job: Geomancer
-- Lucky Number: 3
-- Unlucky Number: 7
-- Level: 67
-- Phantom Roll +1 Value: 1
--
-- Die Roll    | Duration %   
-- --------    -------  
-- 1           |+6     
-- 2           |+7     
-- 3           |+15     
-- 4           |+8     
-- 5           |+9    
-- 6           |+10     
-- 7           |+5    
-- 8           |+11     
-- 9           |+12     
-- 10          |+13     
-- 11          |+20     
-- Bust        |-5    
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/ability");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    local effectID = EFFECT_NATURALISTS_ROLL
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
        corsairSetup(caster, ability, action, EFFECT_NATURALISTS_ROLL, JOBS.GEO);
    end
    local total = caster:getLocalVar("corsairRollTotal")
    return applyRoll(caster,target,ability,action,total)
end;

function applyRoll(caster,target,ability,action,total)
    local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK) + caster:getMod(MOD_PHANTOM_DURATION)
    local effectpowers = {6, 7, 15, 8, 9, 10, 5, 11, 12, 13, 20, -5}
    local effectpower = effectpowers[total];
    if (caster:getLocalVar("corsairRollBonus") == 1 and total < 12) then -- TODO Add logic for Phantom Roll +
        effectpower = effectpower + 5
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
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_NATURALISTS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_ENH_MAGIC_DURATION) == false) then
        ability:setMsg(msgBasic.ROLL_MAIN_FAIL);
    elseif total > 11 then
        ability:setMsg(msgBasic.DOUBLEUP_BUST);
    end
    return total;
end
