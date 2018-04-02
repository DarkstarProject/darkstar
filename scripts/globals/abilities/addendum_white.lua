-----------------------------------
-- Ability: Addendum: White
-- Allows access to additional White Magic spells while using Light Arts.
-- Obtained: Scholar Level 10
-- Recast Time: Stratagem Charge
-- Duration: 2 hours
--
-- Level   |Charges |Recharge Time per Charge
-- -----   -------- ---------------
-- 10      |1       |4:00 minutes
-- 30      |2       |2:00 minutes
-- 50      |3       |1:20 minutes
-- 70      |4       |1:00 minute
-- 90      |5       |48 seconds
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    if player:hasStatusEffect(EFFECT.ADDENDUM_WHITE) then
        return msgBasic.EFFECT.ALREADY_ACTIVE, 0;
    end
    return 0,0;
end;

function onUseAbility(player,target,ability)
    player:delStatusEffectSilent(EFFECT.DARK_ARTS);
    player:delStatusEffectSilent(EFFECT.ADDENDUM_BLACK);
    player:delStatusEffectSilent(EFFECT.LIGHT_ARTS);

    local skillbonus = player:getMod(MOD_LIGHT_ARTS_SKILL);
    local effectbonus = player:getMod(MOD_LIGHT_ARTS_EFFECT);
    local regenbonus = 0;
    if (player:getMainJob() == JOBS.SCH and player:getMainLvl() >= 20) then
        regenbonus = 3 * math.floor((player:getMainLvl() - 10) / 10);
    end

    player:addStatusEffectEx(EFFECT.ADDENDUM_WHITE,EFFECT.ADDENDUM_WHITE,effectbonus,0,7200,0,regenbonus,true);

    return EFFECT.ADDENDUM_WHITE;
end;