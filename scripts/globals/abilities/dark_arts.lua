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
    if player:hasStatusEffect(dsp.effects.DARK_ARTS) or player:hasStatusEffect(dsp.effects.ADDENDUM_BLACK) then
        return msgBasic.EFFECT_ALREADY_ACTIVE, 0;
    end
    return 0,0;
end;

function onUseAbility(player,target,ability)
    player:delStatusEffectSilent(dsp.effects.LIGHT_ARTS);
    player:delStatusEffect(dsp.effects.ADDENDUM_WHITE);
    player:delStatusEffect(dsp.effects.PENURY);
    player:delStatusEffect(dsp.effects.CELERITY);
    player:delStatusEffect(dsp.effects.ACCESSION);
    player:delStatusEffect(dsp.effects.RAPTURE);
    player:delStatusEffect(dsp.effects.ALTRUISM);
    player:delStatusEffect(dsp.effects.TRANQUILITY);
    player:delStatusEffect(dsp.effects.PERPETUANCE);

    local helixbonus = 0;
    if (player:getMainJob() == JOBS.SCH and player:getMainLvl() >= 20) then
        helixbonus = math.floor(player:getMainLvl() / 4);
    end

    player:addStatusEffect(dsp.effects.DARK_ARTS,1,0,7200,0,helixbonus);

    return dsp.effects.DARK_ARTS;
end;