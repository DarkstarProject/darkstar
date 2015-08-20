-----------------------------------
-- Ability: Dancer's Roll
-- Grants Regen status to party members within area of effect
-- Optimal Job: Dancer
-- Lucky Number: 3
-- Unlucky Number: 7
-- Level: 61
--
-- Die Roll    |No DNC              |With DNC
-- --------    ----------           ----------
-- 1           |3HP/Tick            |7HP/Tick
-- 2           |4HP/Tick            |8HP/Tick
-- 3           |12HP/Tick           |16HP/Tick
-- 4           |5HP/Tick            |9HP/Tick
-- 5           |6HP/Tick            |10HP/Tick
-- 6           |7HP/Tick            |11HP/Tick
-- 7           |1HP/Tick            |5HP/Tick
-- 8           |8HP/Tick            |12HP/Tick
-- 9           |9HP/Tick            |13HP/Tick
-- 10          |10HP/Tick           |14HP/Tick
-- 11          |16HP/Tick           |20HP/Tick
-- 12+         |-4hp(regen)/Tick	|-4hp(regen)/Tick
-- A bust will cause a regen effect on you to be reduced by 4, it will not drain HP from you if no regen effect is active.
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
    local effectpowers = {3, 4, 12, 5, 6, 7, 1, 8, 9, 10, 16, 4};
    local effectpower = effectpowers[total]
    if (total < 12 and caster:hasPartyJob(JOB_DNC) ) then
        effectpower = effectpower + 4;
    end

    if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_DANCERS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_REGEN) == false) then
        ability:setMsg(423);
    end
end;