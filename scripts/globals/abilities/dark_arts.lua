-----------------------------------
-- Ability: Dark Arts
-- Optimizes black magic capability while lowering white magic proficiency. Grants a bonus to enfeebling, elemental, and dark magic. Also grants access to Stratagems.
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
    if player:hasStatusEffect(EFFECT_DARK_ARTS) or player:hasStatusEffect(EFFECT_ADDENDUM_BLACK) then
        return MSGBASIC_EFFECT_ALREADY_ACTIVE, 0;
    end
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    player:delStatusEffectSilent(EFFECT_LIGHT_ARTS);
    player:delStatusEffect(EFFECT_ADDENDUM_WHITE);
    player:delStatusEffect(EFFECT_PENURY);
    player:delStatusEffect(EFFECT_CELERITY);
    player:delStatusEffect(EFFECT_ACCESSION);
    player:delStatusEffect(EFFECT_RAPTURE);
    player:delStatusEffect(EFFECT_ALTRUISM);
    player:delStatusEffect(EFFECT_TRANQUILITY);
    player:delStatusEffect(EFFECT_PERPETUANCE);

    local helixbonus = 0;
    if (player:getMainJob() == JOBS.SCH and player:getMainLvl() >= 20) then
        helixbonus = math.floor(player:getMainLvl() / 4);
    end

    player:addStatusEffect(EFFECT_DARK_ARTS,1,0,7200,0,helixbonus);

    return EFFECT_DARK_ARTS;
end;