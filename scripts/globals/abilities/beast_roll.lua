-----------------------------------
-- Ability: Beast Roll
-- Enhances pet attacks for party members within area of effect
-- Optimal Job: Beastmaster
-- Lucky Number: 4
-- Unlucky Number: 8
-- Level: 34
--
-- Die Roll |No BST     |With BST
-- -------- --------    -----------
-- 1        |16         |41
-- 2        |20         |45
-- 3        |24         |49
-- 4        |64         |89
-- 5        |28         |53
-- 6        |32         |57
-- 7        |40         |65
-- 8        |8          |33
-- 9        |44         |69
-- 10       |48         |73
-- 11       |80         |105
-- Bust     |-25        |-25
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
    local effectpowers = {4, 5, 7, 19, 8, 9, 11, 2, 13, 14, 23, 7}
    local effectpower = effectpowers[total]
    if (total < 12 and caster:hasPartyJob(JOB_BST) ) then
        effectpower = effectpower + 10;
    end

    if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_BEAST_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_PET_ATTP) == false) then
        ability:setMsg(423);
    end
end;