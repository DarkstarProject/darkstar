-----------------------------------
-- Ability: Chaos Roll
-- Enhances attack for party members within area of effect
-- Optimal Job: Dark Knight
-- Lucky Number: 4
-- Unlucky Number: 8
-- Level: 14
--
-- Die Roll    |No DRK	|With DRK
-- --------    -------- -----------
-- 1           |6%      |16%
-- 2           |8%      |18%
-- 3           |9%      |19%
-- 4           |25%     |35%
-- 5           |11%     |21%
-- 6           |13%     |23%
-- 7           |16%     |26%
-- 8           |3%      |13%
-- 9           |17%     |27%
-- 10          |19%     |29%
-- 11          |31%     |41%
-- Bust        |-10%    |-10%
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
    local effectpowers = {6, 8, 9, 25, 11, 13, 16, 3, 17, 19, 31, 10}
    local effectpower = effectpowers[total];
    if (total < 12 and caster:hasPartyJob(JOB_DRK) ) then
        effectpower = effectpower + 10;
    end
    if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_CHAOS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_ATTP) == false) then
        ability:setMsg(423);
    end
end;