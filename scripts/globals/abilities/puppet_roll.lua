-----------------------------------
-- Ability: Puppet Roll
-- Enhances pet magic attack and magic accuracy for party members within area of effect
-- Optimal Job: Puppetmaster
-- Lucky Number: 3
-- Unlucky Number: 7
-- Level: 52
--
-- Die Roll    |No PUP  |With PUP
-- --------    -------  ----------
-- 1           |+4      |+12
-- 2           |+5      |+13
-- 3           |+18     |+26
-- 4           |+7      |+15
-- 5           |+9      |+17
-- 6           |+10     |+18
-- 7           |+2      |+10
-- 8           |+11     |+19
-- 9           |+13     |+21
-- 10          |+15     |+23
-- 11          |+22     |+30
-- Bust        |-8      |-8
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
    local effectpowers = {4, 5, 18, 7, 9, 10, 2, 11, 13, 15, 22, 8}
    local effectpower = effectpowers[total]
    if (total < 12 and caster:hasPartyJob(JOB_PUP) ) then
        effectpower = effectpower + 8;
    end

    if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_PUPPET_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_PET_MACC) == false) then
        ability:setMsg(423);
    end
end;