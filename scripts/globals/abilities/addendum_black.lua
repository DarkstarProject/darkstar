-----------------------------------
-- Ability: Addendum: Black
-- Allows access to additional Black Magic spells while using Dark Arts.
-- Obtained: Scholar Level 30
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

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if player:hasStatusEffect(EFFECT_ADDENDUM_BLACK) then
        return MSGBASIC_EFFECT_ALREADY_ACTIVE, 0;
    end
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    player:delStatusEffectSilent(EFFECT_LIGHT_ARTS);
    player:delStatusEffectSilent(EFFECT_ADDENDUM_WHITE);
    player:delStatusEffectSilent(EFFECT_DARK_ARTS);

    local skillbonus = player:getMod(MOD_DARK_ARTS_SKILL);
    local effectbonus = player:getMod(MOD_DARK_ARTS_EFFECT);
    local helixbonus = 0;
    if (player:getMainJob() == JOBS.SCH and player:getMainLvl() >= 20) then
        helixbonus = math.floor(player:getMainLvl() / 4);
    end

    player:addStatusEffectEx(EFFECT_ADDENDUM_BLACK,EFFECT_ADDENDUM_BLACK,effectbonus,0,7200,0,helixbonus,true);

    return EFFECT_ADDENDUM_BLACK;
end;