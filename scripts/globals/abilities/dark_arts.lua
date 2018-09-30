-----------------------------------
-- Ability: Dark Arts
-- Optimizes black magic capability while lowering white magic proficiency. Grants a bonus to enfeebling, elemental, and dark magic. Also grants access to Stratagems.
-- Obtained: Scholar Level 10
-- Recast Time: 1:00
-- Duration: 2:00:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if player:hasStatusEffect(dsp.effect.DARK_ARTS) or player:hasStatusEffect(dsp.effect.ADDENDUM_BLACK) then
        return dsp.msg.basic.EFFECT_ALREADY_ACTIVE, 0
    end
    return 0,0
end

function onUseAbility(player,target,ability)
    player:delStatusEffectSilent(dsp.effect.LIGHT_ARTS)
    player:delStatusEffect(dsp.effect.ADDENDUM_WHITE)
    player:delStatusEffect(dsp.effect.PENURY)
    player:delStatusEffect(dsp.effect.CELERITY)
    player:delStatusEffect(dsp.effect.ACCESSION)
    player:delStatusEffect(dsp.effect.RAPTURE)
    player:delStatusEffect(dsp.effect.ALTRUISM)
    player:delStatusEffect(dsp.effect.TRANQUILITY)
    player:delStatusEffect(dsp.effect.PERPETUANCE)

    local helixbonus = 0
    if (player:getMainJob() == dsp.job.SCH and player:getMainLvl() >= 20) then
        helixbonus = math.floor(player:getMainLvl() / 4)
    end

    player:addStatusEffect(dsp.effect.DARK_ARTS,1,0,7200,0,helixbonus)

    return dsp.effect.DARK_ARTS
end