-----------------------------------
-- Ability: Hasso
-- Grants a bonus to attack speed, accuracy, and Strength when using two-handed weapons, but increases recast and casting times.
-- Obtained: Samurai Level 25
-- Recast Time: 1:00
-- Duration: 5:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(trust,target,ability)
    return 0
end

function onUseAbility(trust,target,ability)
    local strboost = trust:getMainLvl()/7
	trust:addStatusEffect(dsp.effect.HASSO,strboost,0,300)
end