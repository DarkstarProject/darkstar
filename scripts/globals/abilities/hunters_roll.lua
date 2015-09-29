-----------------------------------
-- Ability: Hunter's Roll
-- Enhances accuracy and ranged accuracy for party members within area of effect
-- Optimal Job: Ranger
-- Lucky Number: 4
-- Unlucky Number: 8
-- Level: 11
--
-- Die Roll    |Without RNG |With RNG
-- --------    ------------ -------
-- 1           |+10         |+25
-- 2           |+13         |+28
-- 3           |+15         |+30
-- 4           |+40         |+55
-- 5           |+18         |+33
-- 6           |+20         |+35
-- 7           |+25         |+40
-- 8           |+5          |+20
-- 9           |+27         |+42
-- 10          |+30         |+45
-- 11          |+50         |+65
-- Bust        |-5          |-5
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
        player:setLocalVar("RNG_roll_bonus", 0);
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbilityRoll
-----------------------------------

function onUseAbilityRoll(caster,target,ability,total)
    local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK)
    local effectpowers = {10, 13, 15, 40, 18, 20, 25, 5, 27, 30, 50, 5}
    local effectpower = effectpowers[total]
    local jobBonus = caster:getLocalVar("RNG_roll_bonus");

    if (total < 12) then -- see chaos_roll.lua for comments
        if (jobBonus == 0) then
            if (caster:hasPartyJob(JOB_RNG) or math.random(0, 99) < caster:getMod(MOD_JOB_BONUS_CHANCE)) then
                jobBonus = 1;
            else
                jobBonus = 2;
            end
        end
        if (jobBonus == 1) then
            effectpower = effectpower + 15;
        end
        if (target:getID() == caster:getID()) then
            caster:setLocalVar("RNG_roll_bonus", jobBonus);
        end
    end

    if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_HUNTERS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_ACC) == false) then
        ability:setMsg(423);
    end
end;