-----------------------------------
-- Ability: Magus's Roll
-- Enhances magic defense for party members within area of effect
-- Optimal Job: Blue Mage
-- Lucky Number: 2
-- Unlucky Number: 6
-- Level: 17
--
-- Die Roll    |No BLU  |With BLU
-----------    -------  -----------
-- 1           |+5      |+13
-- 2           |+20     |+28
-- 3           |+6      |+14
-- 4           |+8      |+16
-- 5           |+9      |+17
-- 6           |+3      |+11
-- 7           |+10     |+18
-- 8           |+13     |+21
-- 9           |+14     |+22
-- 10          |+15     |+23
-- 11          |+25     |+33
-- Bust        |-5      |-5
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/ability");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    local effectID = EFFECT_MAGUSS_ROLL
    ability:setRange(ability:getRange() + player:getMod(MOD_ROLL_RANGE));
    if (player:hasStatusEffect(effectID)) then
        return MSGBASIC_ROLL_ALREADY_ACTIVE,0;
    elseif atMaxCorsairBusts(player) then
        return MSGBASIC_CANNOT_PERFORM,0;
    else
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(caster,target,ability,action)
    if (caster:getID() == target:getID()) then
        corsairSetup(caster, ability, action, EFFECT_MAGUSS_ROLL, JOBS.BLU);
    end
    local total = caster:getLocalVar("corsairRollTotal")
    return applyRoll(caster,target,ability,action,total)
end;

function applyRoll(caster,target,ability,action,total)
    local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK)
    local effectpowers = {5, 20, 6, 8, 9, 3, 10, 13, 14, 15, 25, 5}
    local effectpower = effectpowers[total];
    if (caster:getLocalVar("corsairRollBonus") == 1 and total < 12) then
        effectpower = effectpower + 8
    end
    if (caster:getMainJob() == JOBS.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOBS.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_MAGUSS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_MDEF) == false) then
        ability:setMsg(422);
    elseif total > 11 then
        ability:setMsg(426);
    end
    return total;
end
