-----------------------------------
-- Ability: Corsair's Roll
-- Increases the amount of experience points earned by party members within area of effect
-- Optimal Job: Corsair
-- Lucky Number: 5
-- Unlucky Number: 9
-- Level: 5
--
-- Die Roll    |Exp Bonus%
-- --------    -----------
-- 1           |10%
-- 2           |11%
-- 3           |11%
-- 4           |12%
-- 5           |20%
-- 6           |13%
-- 7           |15%
-- 8           |16%
-- 9           |8%
-- 10          |17%
-- 11          |24%
-- 12+         |-6%
--
-- Bust for Corsair set as subjob is also -6%.
-- Corsair set as subjob is 7% on Lucky roll (5) and 1% on Unlucky roll (9).
-- The EXP bonus afforded by Corsair's Roll does not apply within Abyssea.
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/ability");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    local effectID = EFFECT_CORSAIRS_ROLL;
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
-- onUseAbilityRoll
-----------------------------------

function onUseAbility(caster,target,ability,action)
    if (caster:getID() == target:getID()) then
        corsairSetup(caster, ability, action, EFFECT_CORSAIRS_ROLL, JOBS.COR);
    end
    local total = caster:getLocalVar("corsairRollTotal")
    return applyRoll(caster,target,ability,action,total)
end;


function applyRoll(caster,target,ability,action,total)
    local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK)
    local effectpowers = {10, 11, 11, 12, 20, 13, 15, 16, 8, 17, 24, 6};
    local effectpower = effectpowers[total];
    if (caster:getMainJob() == JOBS.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOBS.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_CORSAIRS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_EXP_BONUS) == false) then
        ability:setMsg(422);
    elseif total > 11 then
        ability:setMsg(426);
    end
    return total;
end
