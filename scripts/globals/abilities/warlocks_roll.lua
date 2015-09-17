-----------------------------------
-- Ability: Warlock's Roll
-- Enhances magic accuracy for party members within area of effect
-- Optimal Job: Red Mage
-- Lucky Number: 4
-- Unlucky Number: 8
-- Level: 46
--
-- Die Roll    |No RDM  |With RDM
-- --------    -------- -----------
-- 1           |+2      |+7
-- 2           |+3      |+8
-- 3           |+4      |+9
-- 4           |+12     |+17
-- 5           |+5      |+10
-- 6           |+6      |+11
-- 7           |+7      |+12
-- 8           |+1      |+6
-- 9           |+8      |+13
-- 10          |+9      |+14
-- 11          |+15     |+20
-- Bust        |-5      |-5
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
    local effectpowers = {2, 3, 4, 12, 5, 6, 7, 1, 8, 9, 15, 5}
    local effectpower = effectpowers[total]
    if (total < 12 and caster:hasPartyJob(JOB_RDM) ) then
        effectpower = effectpower + 5;
    end

    if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_WARLOCKS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_MACC) == false) then
        ability:setMsg(423);
    end
end;