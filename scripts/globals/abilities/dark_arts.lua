-----------------------------------
-- Ability: Dark Arts
-- Optimizes black magic capability while lowering white magic proficiency. Grants a bonus to enfeebling, elemental, and dark magic. Also grants access to Stratagems.
-- Obtained: Scholar Level 10
-- Recast Time: 1:00
-- Duration: 2:00:00
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    if player:hasStatusEffect(EFFECT.DARK_ARTS) or player:hasStatusEffect(EFFECT.ADDENDUM_BLACK) then
        return msgBasic.EFFECT.ALREADY_ACTIVE, 0;
    end
    return 0,0;
end;

function onUseAbility(player,target,ability)
    player:delStatusEffectSilent(EFFECT.LIGHT_ARTS);
    player:delStatusEffect(EFFECT.ADDENDUM_WHITE);
    player:delStatusEffect(EFFECT.PENURY);
    player:delStatusEffect(EFFECT.CELERITY);
    player:delStatusEffect(EFFECT.ACCESSION);
    player:delStatusEffect(EFFECT.RAPTURE);
    player:delStatusEffect(EFFECT.ALTRUISM);
    player:delStatusEffect(EFFECT.TRANQUILITY);
    player:delStatusEffect(EFFECT.PERPETUANCE);

    local helixbonus = 0;
    if (player:getMainJob() == JOBS.SCH and player:getMainLvl() >= 20) then
        helixbonus = math.floor(player:getMainLvl() / 4);
    end

    player:addStatusEffect(EFFECT.DARK_ARTS,1,0,7200,0,helixbonus);

    return EFFECT.DARK_ARTS;
end;