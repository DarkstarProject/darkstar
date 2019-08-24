-----------------------------------
-- Ability: Warrior's Charge
-- Will double your next attack.
-- Obtained: Warrior Level 75 (Merit)
-- Recast Time: 5:00
-- Duration: 1:00 or next attack
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(trust,target,ability)
    return 0,0
end

function onUseAbility(trust,target,ability)
    trust:addStatusEffect(dsp.effect.WARRIOR_S_CHARGE,1,0,60)
end