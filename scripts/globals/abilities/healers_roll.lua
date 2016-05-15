-----------------------------------
-- Ability: Healer's Roll
-- Increases potency of "Cure" effect received for party members within area of effect
-- Optimal Job: White Mage
-- Lucky Number: 3
-- Unlucky Number: 7
-- Level: 20
--
-- Die Roll    |No WHM  |With WHM
-- --------    -------  -----------
-- 1           |+3%     |+7%
-- 2           |+4%     |+8%
-- 3           |+12%    |+16%
-- 4           |+5%     |+9%
-- 5           |+6%     |+10%
-- 6           |+7%     |+11%
-- 7           |+1%     |+5%
-- 8           |+8%     |+12%
-- 9           |+9%     |+13%
-- 10          |+10%    |+14%
-- 11          |+16%    |+20%
-- Bust        |-4%     |-4%
--
-- Note that this roll will increase potency of cures received, not the potency of the caster's spells
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/ability");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    local effectID = EFFECT_HEALERS_ROLL
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
        corsairSetup(caster, ability, action, EFFECT_HEALERS_ROLL, JOBS.WHM);
    end
    local total = caster:getLocalVar("corsairRollTotal")
    return applyRoll(caster,target,ability,action,total)
end;

function applyRoll(caster,target,ability,action,total)
    local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK)
    local effectpowers = {3, 4, 12, 5, 6, 7, 1, 8, 9, 10, 16, 4}
    local effectpower = effectpowers[total];
    if (caster:getLocalVar("corsairRollBonus") == 1 and total < 12) then
        effectpower = effectpower + 4
    end
    if (caster:getMainJob() == JOBS.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOBS.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_HEALERS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_CURE_POTENCY_RCVD) == false) then
        ability:setMsg(422);
    elseif total > 11 then
        ability:setMsg(426);
    end
    return total;
end
