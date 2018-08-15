-----------------------------------
-- Ability: Afflatus Misery
-- Inspires you to draw strength from the damage you take.
-- Obtained: White Mage Level 40
-- Recast Time: 1:00
-- Duration: 2 hours
-- Restriction: WHM main only
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
    target:delStatusEffect(dsp.effect.AFFLATUS_SOLACE)
    target:delStatusEffect(dsp.effect.AFFLATUS_MISERY)
    target:addStatusEffect(dsp.effect.AFFLATUS_MISERY,8,0,7200)
end