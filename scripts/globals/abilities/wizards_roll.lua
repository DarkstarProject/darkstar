-----------------------------------
-- Ability: Wizard's Roll
-- Enhances magic attack for party members within area of effect
-- Optimal Job: Black Mage
-- Lucky Number: 5
-- Unlucky Number: 9
-- Level 58
--
-- Die Roll    |No BLM  |With BLM
-- --------    -------- -----------
-- 1           |+2      |+6
-- 2           |+3      |+6
-- 3           |+4      |+7
-- 4           |+4      |+7
-- 5           |+10     |+13
-- 6           |+5      |+8
-- 7           |+6      |+9
-- 8           |+7      |+9
-- 9           |+1      |+5
-- 10          |+7      |+10
-- 11          |+12     |+16
-- Bust        |-4      |-4
--
-- If the Corsair is a lower level than the player receiving Wizard's Roll, the +MAB will be reduced
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/ability");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    local effectID = EFFECT_WIZARDS_ROLL
    ability:setRange(ability:getRange() + player:getMod(MOD_ROLL_RANGE));
    if (player:hasStatusEffect(effectID) or player:hasBustEffect(effectID)) then
        return MSGBASIC_ROLL_ALREADY_ACTIVE,0;
    else
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(caster,target,ability,action)
    if (caster:getID() == target:getID()) then
        corsairSetup(caster, ability, action, EFFECT_WIZARDS_ROLL, JOB_BLM)
    end
    local total = caster:getLocalVar("corsairRollTotal")
    return applyRoll(caster,target,ability,action,total)
end;

function applyRoll(caster,target,ability,action,total)
    local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK)
    local effectpowers = {2, 3, 4, 4, 10, 5, 6, 7, 1, 7, 12, 4};
    local effectpower = effectpowers[total];
    if (caster:getLocalVar("corsairRollBonus") == 1 and total < 12) then
        effectpower = effectpower + 3
    end
    if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_WIZARDS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_MATT) == false) then
        ability:setMsg(422);
    elseif total > 11 then
        ability:setMsg(426);
    end
    return total;
end
