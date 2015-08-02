-----------------------------------
-- Ability: Monk's Roll
-- Enhances "Subtle Blow" effect for party members within area of effect
-- Optimal Job: Monk
-- Lucky Number: 3
-- Unlucky Number: 7
-- Level: 31
--
-- Die Roll    |No MNK  |With MNK
-- --------    -------- -----------
-- 1           |+8      |+18
-- 2           |+10     |+20
-- 3           |+32     |+42
-- 4           |+12     |+22
-- 5           |+14     |+24
-- 6           |+16     |+26
-- 7           |+4      |+14
-- 8           |+20     |+30
-- 9           |+22     |+32
-- 10          |+24     |+34
-- 11          |+40     |+50
-- Bust        |-11     |-11
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    local effectID = getCorsairRollEffect(ability:getID());
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
    local effectpowers = {8, 10, 32, 12, 14, 16, 4, 20, 22, 24, 40, 11}
    local effectpower = effectpowers[total]
    if (total < 12 and caster:hasPartyJob(JOB_MNK) ) then
        effectpower = effectpower + 10;
    end

    if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_MONKS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_SUBTLE_BLOW) == false) then
        ability:setMsg(423);
    end
end;