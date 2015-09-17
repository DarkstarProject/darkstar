-----------------------------------
-- Ability: Ninja Roll
-- Enhances evasion for party members within area of effect
-- Optimal Job: Ninja
-- Lucky Number: 4
-- Unlucky Number: 8
-- Jobs:
-- Corsair Level 8
--
-- Die Roll    |With NIN
-- --------    ----------
-- 1           |+4
-- 2           |+6
-- 3           |+8
-- 4           |+25
-- 5           |+10
-- 6           |+12
-- 7           |+14
-- 8           |+2
-- 9           |+17
-- 10          |+20
-- 11          |+30
-- Bust        |-10
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    local effectID = getCorsairRollEffect(ability:getID());
    ability:setRange(ability:getRange() + player:getMod(MOD_ROLL_RANGE));
    if (player:hasStatusEffect(effectID) or player:hasBustEffect(effectID)) then
        return MSGBASIC_ROLL_ALREADY_ACTIVE,0;
    else
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbilityRoll
-----------------------------------

function onUseAbilityRoll(caster,target,ability,total)
    local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK)
    local effectpowers = {4, 5, 5, 14, 6, 7, 9, 2, 10, 11, 18, 6}
    local effectpower = effectpowers[total]
    if (total < 12 and caster:hasPartyJob(JOB_NIN) ) then
        effectpower = effectpower + 6;
    end
    if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_NINJA_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_EVA) == false) then
        ability:setMsg(423);
    end
end;