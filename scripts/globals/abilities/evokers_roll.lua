-----------------------------------
-- Ability: Evoker's Roll
-- Gradually restores MP for party members within area of effect
-- Optimal Job: Summoner
-- Lucky Number: 5
-- Unlucky Number: 9
-- Level: 40
--
-- Die Roll    |No SMN  |With SMN
-- --------    -------  -----------
-- 1           |+1      |+2
-- 2           |+1      |+2
-- 3           |+1      |+2
-- 4           |+1      |+2
-- 5           |+3      |+4
-- 6           |+2      |+3
-- 7           |+2      |+3
-- 8           |+2      |+3
-- 9           |+1      |+2
-- 10          |+3      |+4
-- 11          |+4      |+5
-- Bust        |-1      |-1
--
-- Busting on Evoker's Roll will give you -1MP/tick less on your own total MP refreshed; i.e. you do not actually lose MP
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
        player:setLocalVar("SMN_roll_bonus", 0);
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbilityRoll
-----------------------------------

function onUseAbilityRoll(caster,target,ability,total)
    local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK)
    local effectpowers = {1, 1, 1, 1, 3, 2, 2, 2, 1, 3, 4, 1}
    local effectpower = effectpowers[total]
    local jobBonus = caster:getLocalVar("SMN_roll_bonus");

    if (total < 12) then -- see chaos_roll.lua for comments
        if (jobBonus == 0) then
            if (caster:hasPartyJob(JOB_SMN) or math.random(0, 99) < caster:getMod(MOD_JOB_BONUS_CHANCE)) then
                jobBonus = 1;
            else
                jobBonus = 2;
            end
        end
        if (jobBonus == 1) then
            effectpower = effectpower + 1;
        end
        if (target:getID() == caster:getID()) then
            caster:setLocalVar("SMN_roll_bonus", jobBonus);
        end
    end

    if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_EVOKERS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_REFRESH) == false) then
        ability:setMsg(423);
    end
end;