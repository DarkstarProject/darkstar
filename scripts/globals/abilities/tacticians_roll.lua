-----------------------------------
-- Ability: Tacticians's Roll
-- Grants a Regain effect to party members within area of effect.
-- Optimal Job: None
-- Lucky Number: 5
-- Unlucky Number: 8
-- Level: 86
-- Phantom Roll +1 Value: 2
--
-- Die Roll    | Regain
-- --------    -------
-- 1           |+10
-- 2           |+10
-- 3           |+10
-- 4           |+10
-- 5           |+30
-- 6           |+10
-- 7           |+10
-- 8           |+0
-- 9           |+20
-- 10          |+20
-- 11          |+40
-- Bust        |-10
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    local effectID = dsp.effect.TACTICIANS_ROLL
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
        corsairSetup(caster, ability, action, dsp.effect.TACTICIANS_ROLL, dsp.job.COR)
    end
    local total = caster:getLocalVar("corsairRollTotal")
    return applyRoll(caster,target,ability,action,total)
end

function applyRoll(caster,target,ability,action,total)
    local duration = 300 + caster:getMerit(dsp.merit.WINNING_STREAK) + caster:getMod(dsp.mod.PHANTOM_DURATION)
    local effectpowers = {10, 10, 10, 10, 30, 10, 10, 0, 20, 20, 40, -10}
    local effectpower = effectpowers[total]
-- Apply Buffs from Tactician's Roll Enhancing Gear if present
    if (math.random(0, 99) < caster:getMod(dsp.mod.ENHANCES_TACTICIANS_ROLL)) then
        effectpower = effectpower + 10
    end
-- Apply Additional Phantom Roll+ Buff
    local phantomBase = 2 -- Base increment buff
    local effectpower = effectpower + (phantomBase * phantombuffMultiple(caster))
-- Check if COR Main or Sub
    if (caster:getMainJob() == dsp.job.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl())
    elseif (caster:getSubJob() == dsp.job.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl())
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(dsp.merit.BUST_DURATION), dsp.effect.TACTICIANS_ROLL, effectpower, 0, duration, caster:getID(), total, dsp.mod.REGAIN) == false) then
        ability:setMsg(dsp.msg.basic.ROLL_MAIN_FAIL)
    elseif total > 11 then
        ability:setMsg(dsp.msg.basic.DOUBLEUP_BUST)
    end
    return total
end
