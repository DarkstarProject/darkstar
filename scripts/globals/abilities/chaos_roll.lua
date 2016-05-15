-----------------------------------
-- Ability: Chaos Roll
-- Enhances attack for party members within area of effect
-- Optimal Job: Dark Knight
-- Lucky Number: 4
-- Unlucky Number: 8
-- Level: 14
--
-- Die Roll    |No DRK    |With DRK
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
require("scripts/globals/ability");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    local effectID = EFFECT_CHAOS_ROLL
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
        corsairSetup(caster, ability, action, EFFECT_CHAOS_ROLL, JOBS.DRK);
    end
    local total = caster:getLocalVar("corsairRollTotal")
    return applyRoll(caster,target,ability,action,total)
end;

function onUseAbilityRoll(caster,target,ability,total)

    local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK)
    local effectpowers = {6, 8, 9, 25, 11, 13, 16, 3, 17, 19, 31, 10}
    local effectpower = effectpowers[total];
    local jobBonus = caster:getLocalVar("DRK_roll_bonus");

    if (total < 12) then
        if (jobBonus == 0) then -- this happens on the first roll only, and only for the roller
            if (caster:hasPartyJob(JOB_DRK) or math.random(0, 99) < caster:getMod(MOD_JOB_BONUS_CHANCE)) then
                jobBonus = 1; -- enables job boost
                -- print("first roll w/ bonus")
            else
                jobBonus = 2; -- setting this to 2 so it doesn't allow for another attempt to apply the job bonus with the modifier upon double-up.
                -- print("first roll")
            end
        end
        if (jobBonus == 1) then
            effectpower = effectpower + 10;
            -- print("activate job bonus");
        end
        if (target:getID() == caster:getID()) then -- only need to set the variable for the caster, and just once.
            caster:setLocalVar("DRK_roll_bonus", jobBonus);
        end
        -- print(caster:getLocalVar("DRK_roll_bonus"));
    end

    if (caster:getMainJob() == JOBS.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOBS.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_CHAOS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_ATTP) == false) then
        ability:setMsg(423);
    end
end;

function applyRoll(caster,target,ability,action,total)
    local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK)
    local effectpowers = {6, 8, 9, 25, 11, 13, 16, 3, 17, 19, 31, 10}
    local effectpower = effectpowers[total];
    if (caster:getLocalVar("corsairRollBonus") == 1 and total < 12) then
        effectpower = effectpower + 10
    end
    if (caster:getMainJob() == JOBS.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOBS.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_CHAOS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_ATTP) == false) then
        ability:setMsg(422);
    elseif total > 11 then
        ability:setMsg(426);
    end
    return total;
end
