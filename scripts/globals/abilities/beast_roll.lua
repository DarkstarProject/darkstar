-----------------------------------
-- Ability: Beast Roll
-- Enhances pet attacks for party members within area of effect
-- Optimal Job: Beastmaster
-- Lucky Number: 4
-- Unlucky Number: 8
-- Level: 34
-- Phantom Roll +1 Value: 3
-- 
-- Die Roll |No BST     |With BST
-- -------- --------    -----------
-- 1        |16         |41
-- 2        |20         |45
-- 3        |24         |49
-- 4        |64         |89
-- 5        |28         |53
-- 6        |32         |57
-- 7        |40         |65
-- 8        |8          |33
-- 9        |44         |69
-- 10       |48         |73
-- 11       |80         |105
-- Bust     |-25        |-25
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/ability");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    local effectID = dsp.effects.BEAST_ROLL
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
        corsairSetup(caster, ability, action, dsp.effects.BEAST_ROLL, dsp.jobs.BST);
    end
    local total = caster:getLocalVar("corsairRollTotal")
    return applyRoll(caster,target,ability,action,total)
end;

function applyRoll(caster,target,ability,action,total)
    local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK) + caster:getMod(MOD_PHANTOM_DURATION)
    local effectpowers = {4, 5, 7, 19, 8, 9, 11, 2, 13, 14, 23, 7}
    local effectpower = effectpowers[total];
    if (caster:getLocalVar("corsairRollBonus") == 1 and total < 12) then
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
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), dsp.effects.BEAST_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_PET_ATTP) == false) then
        ability:setMsg(msgBasic.ROLL_MAIN_FAIL);
    elseif total > 11 then
        ability:setMsg(msgBasic.DOUBLEUP_BUST);
    end
    return total;
end
