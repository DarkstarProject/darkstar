-----------------------------------
-- Ability: Assassin's Charge
-- Will triple your next attack.
-- Obtained: Thief Level 75
-- Recast Time: 5:00
-- Duration: 1:00 minute
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
    local merits = player:getMerit(dsp.merit.ASSASSINS_CHARGE)
    player:addStatusEffect(dsp.effect.ASSASSINS_CHARGE, merits - 5, 0, 60, player:getMod(dsp.mod.AUGMENTS_ASSASSINS_CHARGE), merits / 5)
end