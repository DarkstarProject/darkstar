-----------------------------------
-- Ability: Allies's Roll
-- Enhances skillchain damage and skillchain accuracy for party members within area of effect.
-- Optimal Job: None
-- Lucky Number: 3
-- Unlucky Number: 10
-- Level: 89
-- Phantom Roll +1 Value: 1
--
-- Die Roll    | Skillchain Bonus
-- --------    -------
-- 1           |+2
-- 2           |+3
-- 3           |+20
-- 4           |+5
-- 5           |+7
-- 6           |+9
-- 7           |+11
-- 8           |+13
-- 9           |+15
-- 10          |+1
-- 11          |+25
-- Bust        |-5
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    local effectID = dsp.effect.ALLIES_ROLL
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
        corsairSetup(caster, ability, action, dsp.effect.ALLIES_ROLL, dsp.job.COR)
    end
    local total = caster:getLocalVar("corsairRollTotal")
    return applyRoll(caster,target,ability,action,total)
end

function applyRoll(caster,target,ability,action,total)
    local duration = 300 + caster:getMerit(dsp.merit.WINNING_STREAK) + caster:getMod(dsp.mod.PHANTOM_DURATION)
    local effectpowers = {2, 3, 20, 5, 7, 9, 11, 13, 15, 1, 25, -5}
    local effectpower = effectpowers[total]
-- Apply Buffs from Allies' Roll Enhancing Gear if present
    if (math.random(0, 99) < caster:getMod(dsp.mod.ENHANCES_ALLIES_ROLL)) then
        effectpower = effectpower + 5
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
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(dsp.merit.BUST_DURATION), dsp.effect.ALLIES_ROLL, effectpower, 0, duration, caster:getID(), total, dsp.mod.SKILLCHAINBONUS) == false) then
        ability:setMsg(dsp.msg.basic.ROLL_MAIN_FAIL)
    elseif total > 11 then
        ability:setMsg(dsp.msg.basic.DOUBLEUP_BUST)
    end
    return total
end
