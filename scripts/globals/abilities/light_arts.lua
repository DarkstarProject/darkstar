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
    if player:hasStatusEffect(dsp.effects.LIGHT_ARTS) or player:hasStatusEffect(dsp.effects.ADDENDUM_WHITE) then
        return msgBasic.EFFECT_ALREADY_ACTIVE, 0;
    end
    return 0,0;
end;

function onUseAbility(player,target,ability)
    player:delStatusEffectSilent(dsp.effects.DARK_ARTS);
    player:delStatusEffect(dsp.effects.ADDENDUM_BLACK);
    player:delStatusEffect(dsp.effects.PARSIMONY);
    player:delStatusEffect(dsp.effects.ALACRITY);
    player:delStatusEffect(dsp.effects.MANIFESTATION);
    player:delStatusEffect(dsp.effects.EBULLIENCE);
    player:delStatusEffect(dsp.effects.FOCALIZATION);
    player:delStatusEffect(dsp.effects.EQUANIMITY);
    player:delStatusEffect(dsp.effects.IMMANENCE);

    local skillbonus = player:getMod(MOD_LIGHT_ARTS_SKILL);
    local effectbonus = player:getMod(MOD_LIGHT_ARTS_EFFECT);
    local regenbonus = 0;
    if (player:getMainJob() == JOBS.SCH and player:getMainLvl() >= 20) then
        regenbonus = 3 * math.floor((player:getMainLvl() - 10) / 10);
    end

    player:addStatusEffect(dsp.effects.LIGHT_ARTS,effectbonus,0,7200,0,regenbonus);

    return dsp.effects.LIGHT_ARTS;
end;