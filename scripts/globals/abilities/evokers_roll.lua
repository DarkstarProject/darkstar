-----------------------------------
-- Ability: Evoker's Roll
-- Gradually restores MP for party members within area of effect
-- Optimal Job: Summoner
-- Lucky Number: 5
-- Unlucky Number: 9
-- Level: 40
-- Phantom Roll +1 Value: 1
--
-- Die Roll    |No SMN  |With SMN
-- --------    -------  -----------
-- 1           |+1      |+2
-- 2           |+1      |+2
-- 3           |+1      |+2
-- 4           |+1      |+2
-- 5           |+3      |+4
-- 6           |+2      |+3
-- 7           |+2      |+3
-- 8           |+2      |+3
-- 9           |+1      |+2
-- 10          |+3      |+4
-- 11          |+4      |+5
-- Bust        |-1      |-1
--
-- Busting on Evoker's Roll will give you -1MP/tick less on your own total MP refreshed i.e. you do not actually lose MP
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    local effectID = dsp.effect.EVOKERS_ROLL
    ability:setRange(ability:getRange() + player:getMod(dsp.mod.ROLL_RANGE))
    if (player:hasStatusEffect(effectID)) then
        return dsp.msg.basic.ROLL_ALREADY_ACTIVE,0
    elseif atMaxCorsairBusts(player) then
        return dsp.msg.basic.CANNOT_PERFORM,0
    else
        return 0,0
    end
end

function onUseAbility(caster,target,ability,action)
    if (caster:getID() == target:getID()) then
        corsairSetup(caster, ability, action, dsp.effect.EVOKERS_ROLL, dsp.job.SMN)
    end
    local total = caster:getLocalVar("corsairRollTotal")
    return applyRoll(caster,target,ability,action,total)
end

function applyRoll(caster,target,ability,action,total)
    local duration = 300 + caster:getMerit(dsp.merit.WINNING_STREAK) + caster:getMod(dsp.mod.PHANTOM_DURATION)
    local effectpowers = {1, 1, 1, 1, 3, 2, 2, 2, 1, 3, 4, 1}
    local effectpower = effectpowers[total]
    if (caster:getLocalVar("corsairRollBonus") == 1 and total < 12) then
        effectpower = effectpower + 1
    end
-- Apply Additional Phantom Roll+ Buff
    local phantomBase = 1 -- Base increment buff
    local effectpower = effectpower + (phantomBase * phantombuffMultiple(caster))
-- Check if COR Main or Sub
    if (caster:getMainJob() == dsp.job.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl())
    elseif (caster:getSubJob() == dsp.job.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl())
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(dsp.merit.BUST_DURATION), dsp.effect.EVOKERS_ROLL, effectpower, 0, duration, caster:getID(), total, dsp.mod.REFRESH) == false) then
        ability:setMsg(dsp.msg.basic.ROLL_MAIN_FAIL)
    elseif total > 11 then
        ability:setMsg(dsp.msg.basic.DOUBLEUP_BUST)
    end
    return total
end
