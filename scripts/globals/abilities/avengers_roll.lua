-----------------------------------
-- Ability: Avenger's Roll
-- Increases chance of countering for party members within area of effect.
-- Optimal Job: None
-- Lucky Number: 4
-- Unlucky Number: 8
-- Level: 97
-- 
-- No community data available. Substituting Fighters Roll %
-- Phantom Roll +1 Value: 1
-- 
-- Die Roll    |Counter
-- --------    -------- 
-- 1           |2%      
-- 2           |2%      
-- 3           |3%      
-- 4           |12%      
-- 5           |4%     
-- 6           |5%      
-- 7           |6%      
-- 8           |1%      
-- 9           |7%      
-- 10          |9%      
-- 11          |18%     
-- 12+         |-6%     

-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/ability");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    local effectID = EFFECT_AVENGERS_ROLL
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
        corsairSetup(caster, ability, action, EFFECT_AVENGERS_ROLL, JOBS.COR);
    end
    local total = caster:getLocalVar("corsairRollTotal")
    return applyRoll(caster,target,ability,action,total)
end;

function applyRoll(caster,target,ability,action,total)
    local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK) + caster:getMod(MOD_PHANTOM_DURATION)
    local effectpowers = {2, 2, 3, 12, 4, 5, 6, 1, 7, 9, 18, 6}
    local effectpower = effectpowers[total];
-- Apply Additional Phantom Roll+ Buff
    local phantomBase = 1; -- Base increment buff
    local effectpower = effectpower + (phantomBase * phantombuffMultiple(caster))
-- Check if COR Main or Sub
    if (caster:getMainJob() == JOBS.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOBS.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_AVENGERS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_COUNTER) == false) then
        ability:setMsg(msgBasic.ROLL_MAIN_FAIL);
    elseif total > 11 then
        ability:setMsg(msgBasic.DOUBLEUP_BUST);
    end
    return total;
end
