-----------------------------------
-- Ability: Light Arts
-- Optimizes white magic capability while lowering black magic proficiency. Grants a bonus to divine, enhancing, enfeebling, and healing magic. Also grants access to Stratagems.
-- Obtained: Scholar Level 10
-- Recast Time: 1:00
-- Duration: 2:00:00
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    if player:hasStatusEffect(EFFECT.LIGHT_ARTS) or player:hasStatusEffect(EFFECT.ADDENDUM_WHITE) then
        return msgBasic.EFFECT.ALREADY_ACTIVE, 0;
    end
    return 0,0;
end;

function onUseAbility(player,target,ability)
    player:delStatusEffectSilent(EFFECT.DARK_ARTS);
    player:delStatusEffect(EFFECT.ADDENDUM_BLACK);
    player:delStatusEffect(EFFECT.PARSIMONY);
    player:delStatusEffect(EFFECT.ALACRITY);
    player:delStatusEffect(EFFECT.MANIFESTATION);
    player:delStatusEffect(EFFECT.EBULLIENCE);
    player:delStatusEffect(EFFECT.FOCALIZATION);
    player:delStatusEffect(EFFECT.EQUANIMITY);
    player:delStatusEffect(EFFECT.IMMANENCE);

    local skillbonus = player:getMod(MOD_LIGHT_ARTS_SKILL);
    local effectbonus = player:getMod(MOD_LIGHT_ARTS_EFFECT);
    local regenbonus = 0;
    if (player:getMainJob() == JOBS.SCH and player:getMainLvl() >= 20) then
        regenbonus = 3 * math.floor((player:getMainLvl() - 10) / 10);
    end

    player:addStatusEffect(EFFECT.LIGHT_ARTS,effectbonus,0,7200,0,regenbonus);

    return EFFECT.LIGHT_ARTS;
end;