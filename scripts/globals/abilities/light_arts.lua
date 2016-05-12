-----------------------------------
-- Ability: Light Arts
-- Optimizes white magic capability while lowering black magic proficiency. Grants a bonus to divine, enhancing, enfeebling, and healing magic. Also grants access to Stratagems.
-- Obtained: Scholar Level 10
-- Recast Time: 1:00
-- Duration: 2:00:00
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if player:hasStatusEffect(EFFECT_LIGHT_ARTS) or player:hasStatusEffect(EFFECT_ADDENDUM_WHITE) then
        return MSGBASIC_EFFECT_ALREADY_ACTIVE, 0;
    end
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    player:delStatusEffectSilent(EFFECT_DARK_ARTS);
    player:delStatusEffect(EFFECT_ADDENDUM_BLACK);
    player:delStatusEffect(EFFECT_PARSIMONY);
    player:delStatusEffect(EFFECT_ALACRITY);
    player:delStatusEffect(EFFECT_MANIFESTATION);
    player:delStatusEffect(EFFECT_EBULLIENCE);
    player:delStatusEffect(EFFECT_FOCALIZATION);
    player:delStatusEffect(EFFECT_EQUANIMITY);
    player:delStatusEffect(EFFECT_IMMANENCE);

    local skillbonus = player:getMod(MOD_LIGHT_ARTS_SKILL);
    local effectbonus = player:getMod(MOD_LIGHT_ARTS_EFFECT);
    local regenbonus = 0;
    if (player:getMainJob() == JOBS.SCH and player:getMainLvl() >= 20) then
        regenbonus = 3 * math.floor((player:getMainLvl() - 10) / 10);
    end

    player:addStatusEffect(EFFECT_LIGHT_ARTS,effectbonus,0,7200,0,regenbonus);

    return EFFECT_LIGHT_ARTS;
end;