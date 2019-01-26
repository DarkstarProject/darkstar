-----------------------------------
-- Ability: Afflatus Solace
-- Inspires you to draw strength from the healing spells you cast.
-- Obtained: White Mage Level 40
-- Recast Time: 1:00
-- Duration: 2 hours
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
    target:delStatusEffect(dsp.effect.AFFLATUS_SOLACE)
    target:delStatusEffect(dsp.effect.AFFLATUS_MISERY)
    target:addStatusEffect(dsp.effect.AFFLATUS_SOLACE,8,0,7200)
end