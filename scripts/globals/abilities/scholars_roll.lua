-----------------------------------
-- Ability: Scholar's Roll
-- Enhances Conserve MP effect for party members within area of effect
-- Optimal Job: Scholar
-- Lucky Number: 2
-- Unlucky Number: 6
-- Level: 64
-- Phantom Roll +1 Value: 1
--
-- Data unknown
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    local effectID = dsp.effect.SCHOLARS_ROLL
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
        corsairSetup(caster, ability, action, dsp.effect.SCHOLARS_ROLL, dsp.job.SCH)
    end
    local total = caster:getLocalVar("corsairRollTotal")
    return applyRoll(caster,target,ability,action,total)
end

function applyRoll(caster,target,ability,action,total)
    local duration = 300 + caster:getMerit(dsp.merit.WINNING_STREAK) + caster:getMod(dsp.mod.PHANTOM_DURATION)
    local effectpowers = {2, 9, 3, 4, 5, 2, 6, 6, 7, 9, 14, 4} --mostly random guesses
    local effectpower = effectpowers[total]
    if (caster:getLocalVar("corsairRollBonus") == 1 and total < 12) then
        effectpower = effectpower + 4
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
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(dsp.merit.BUST_DURATION), dsp.effect.SCHOLARS_ROLL, effectpower, 0, duration, caster:getID(), total, dsp.mod.CONSERVE_MP) == false) then
        ability:setMsg(dsp.msg.basic.ROLL_MAIN_FAIL)
    elseif total > 11 then
        ability:setMsg(dsp.msg.basic.DOUBLEUP_BUST)
    end
    return total
end
