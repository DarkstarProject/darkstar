-----------------------------------
-- Ability: Gallant's Roll
-- Reduces physical damage taken by party members within area of effect
-- Optimal Job: Paladin
-- Lucky Number: 3
-- Unlucky Number: 7
-- Level: 55
--
-- Die Roll    |No PLD  |With PLD
-- --------    -------  -----------
-- 1           |4%      |14%
-- 2           |5%      |15%
-- 3           |15%     |25%
-- 4           |6%      |16%
-- 5           |7%      |17%
-- 6           |8%      |18%
-- 7           |3%      |13%
-- 8           |9%      |19%
-- 9           |10%     |20%
-- 10          |12%     |22%
-- 11          |20%     |30%
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
        player:setLocalVar("PLD_roll_bonus", 0);
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbilityRoll
-----------------------------------

function onUseAbilityRoll(caster,target,ability,total)
    local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK)
    local effectpowers = {4, 5, 15, 6, 7, 8, 3, 9, 10, 12, 20, 10}
    local effectpower = effectpowers[total]
    local jobBonus = caster:getLocalVar("PLD_roll_bonus");

    if (total < 12) then -- see chaos_roll.lua for comments
        if (jobBonus == 0) then
            if (caster:hasPartyJob(JOB_PLD) or math.random(0, 99) < caster:getMod(MOD_JOB_BONUS_CHANCE)) then
                jobBonus = 1;
            else
                jobBonus = 2;
            end
        end
        if (jobBonus == 1) then
            effectpower = effectpower + 10;
        end
        if (target:getID() == caster:getID()) then
            caster:setLocalVar("PLD_roll_bonus", jobBonus);
        end
    end

    if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_GALLANTS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_DMG) == false) then
        ability:setMsg(423);
    end
end;