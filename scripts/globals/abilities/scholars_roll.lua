-----------------------------------
-- Ability: Scholar's Roll
-- Enhances Conserve MP effect for party members within area of effect
-- Optimal Job: Scholar
-- Lucky Number: 2
-- Unlucky Number: 6
-- Level: 64
--
-- Data unknown
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
    local effectpowers = {2, 9, 3, 4, 5, 2, 6, 6, 7, 9, 14, 4}; --mostly random guesses
    local effectpower = effectpowers[total]
    if (total < 12 and caster:hasPartyJob(JOB_SCH) ) then
        effectpower = effectpower + 4;
    end

    if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_SCHOLARS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_CONSERVE_MP) == false) then
        ability:setMsg(423);
    end
end;