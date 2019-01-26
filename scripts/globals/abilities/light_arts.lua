-----------------------------------
-- Ability: Light Arts
-- Optimizes white magic capability while lowering black magic proficiency. Grants a bonus to divine, enhancing, enfeebling, and healing magic. Also grants access to Stratagems.
-- Obtained: Scholar Level 10
-- Recast Time: 1:00
-- Duration: 2:00:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if player:hasStatusEffect(dsp.effect.LIGHT_ARTS) or player:hasStatusEffect(dsp.effect.ADDENDUM_WHITE) then
        return dsp.msg.basic.EFFECT_ALREADY_ACTIVE, 0
    end
    return 0,0
end

function onUseAbility(player,target,ability)
    player:delStatusEffectSilent(dsp.effect.DARK_ARTS)
    player:delStatusEffect(dsp.effect.ADDENDUM_BLACK)
    player:delStatusEffect(dsp.effect.PARSIMONY)
    player:delStatusEffect(dsp.effect.ALACRITY)
    player:delStatusEffect(dsp.effect.MANIFESTATION)
    player:delStatusEffect(dsp.effect.EBULLIENCE)
    player:delStatusEffect(dsp.effect.FOCALIZATION)
    player:delStatusEffect(dsp.effect.EQUANIMITY)
    player:delStatusEffect(dsp.effect.IMMANENCE)

    local skillbonus = player:getMod(dsp.mod.LIGHT_ARTS_SKILL)
    local effectbonus = player:getMod(dsp.mod.LIGHT_ARTS_EFFECT)
    local regenbonus = 0
    if (player:getMainJob() == dsp.job.SCH and player:getMainLvl() >= 20) then
        regenbonus = 3 * math.floor((player:getMainLvl() - 10) / 10)
    end

    player:addStatusEffect(dsp.effect.LIGHT_ARTS,effectbonus,0,7200,0,regenbonus)

    return dsp.effect.LIGHT_ARTS
end