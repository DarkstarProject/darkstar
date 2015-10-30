-----------------------------------
-- Ability: Choral Roll
-- Decreases spell interruption rate for party members within area of effect
-- Optimal Job: Bard
-- Lucky Number: 2
-- Unlucky Number: 6
-- Level: 26
--
-- Die Roll     |No BRD     |With BRD
-- --------     --------    -------
-- 1            |-13        |-38
-- 2            |-55        |-80
-- 3            |-17        |-42
-- 4            |-20        |-45
-- 5            |-25        |-50
-- 6            |-8         |-33
-- 7            |-30        |-55
-- 8            |-35        |-60
-- 9            |-40        |-65
-- 10           |-45        |-70
-- 11           |-65        |-90
-- Bust         |+25        |+25
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
        player:setLocalVar("BRD_roll_bonus", 0);
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbilityRoll
-----------------------------------

function onUseAbilityRoll(caster,target,ability,total)
    local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK)
    local effectpowers = {13, 55, 17, 20, 25, 8, 30, 35, 40, 45, 65, 25}
    local effectpower = effectpowers[total]
    local jobBonus = caster:getLocalVar("BRD_roll_bonus");

    if (total < 12) then -- see chaos_roll.lua for comments
        if (jobBonus == 0) then
            if (caster:hasPartyJob(JOB_BRD) or math.random(0, 99) < caster:getMod(MOD_JOB_BONUS_CHANCE)) then
                jobBonus = 1;
            else
                jobBonus = 2;
            end
        end
        if (jobBonus == 1) then
            effectpower = effectpower + 25;
        end
        if (target:getID() == caster:getID()) then
            caster:setLocalVar("BRD_roll_bonus", jobBonus);
        end
    end

    if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_CHORAL_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_SPELLINTERRUPT) == false) then
        ability:setMsg(423);
    end
end;