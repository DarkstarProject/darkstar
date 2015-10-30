-----------------------------------
-- Ability: Fighter's Roll
-- Improves "Double Attack" rate for party members within area of effect
-- Optimal Job: Warrior
-- Lucky Number: 5
-- Unlucky Number: 9
-- Level: 49
--
-- Die Roll    |No WAR  |With WAR
-- --------    -------- -----------
-- 1           |2%      |8%
-- 2           |2%      |8%
-- 3           |3%      |9%
-- 4           |4%      |10%
-- 5           |12%     |18%
-- 6           |5%      |11%
-- 7           |6%      |12%
-- 8           |7%      |13%
-- 9           |1%      |7%
-- 10          |9%      |15%
-- 11          |18%     |24%
-- 12+         |-6%     |-6%
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
        player:setLocalVar("WAR_roll_bonus", 0);
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbilityRoll
-----------------------------------

function onUseAbilityRoll(caster,target,ability,total)
    local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK)
    local effectpowers = {2, 2, 3, 4, 12, 5, 6, 7, 1, 9, 18, 6}
    local effectpower = effectpowers[total]
    local jobBonus = caster:getLocalVar("WAR_roll_bonus");

    if (total < 12) then -- see chaos_roll.lua for comments
        if (jobBonus == 0) then
            if (caster:hasPartyJob(JOB_WAR) or math.random(0, 99) < caster:getMod(MOD_JOB_BONUS_CHANCE)) then
                jobBonus = 1;
            else
                jobBonus = 2;
            end
        end
        if (jobBonus == 1) then
            effectpower = effectpower + 6;
        end
        if (target:getID() == caster:getID()) then
            caster:setLocalVar("WAR_roll_bonus", jobBonus);
        end
    end

    if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_FIGHTERS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_DOUBLE_ATTACK) == false) then
        ability:setMsg(423);
    end
end;