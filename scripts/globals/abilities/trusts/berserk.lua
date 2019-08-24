-----------------------------------
-- Ability: Berserk
-- Enhances attacks but weakens defense.
-- Obtained: Warrior Level 15
-- Recast Time: 5:00
-- Duration: 3:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(trust,target,ability)
    return 0,0
end

function onUseAbility(trust,target,ability)
    trust:addStatusEffect(dsp.effect.BERSERK,1,0,180)

    return dsp.effect.BERSERK
end