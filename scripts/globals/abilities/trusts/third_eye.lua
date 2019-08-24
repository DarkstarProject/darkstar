-----------------------------------
-- Ability: Third Eye
-- Anticipates and dodges the next attack directed at you.
-- Obtained: Samurai Level 15
-- Recast Time: 1:00
-- Duration: 0:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(trust,target,ability)
    return 0
end

function onUseAbility(trust,target,ability)
    trust:addStatusEffect(dsp.effect.THIRD_EYE,0,0,30) --power keeps track of procs
end
