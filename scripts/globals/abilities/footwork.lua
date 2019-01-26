-----------------------------------
-- Ability: Footwork
-- Makes kicks your primary mode of attack.
-- Obtained: Monk Level 65
-- Recast Time: 5:00
-- Duration: 1:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    local kickDmg = 20 + player:getWeaponDmg()
    local kickAttPercent = 25 + player:getMod(dsp.mod.FOOTWORK_ATT_BONUS)
    player:addStatusEffect(dsp.effect.FOOTWORK, kickDmg, 0, 60, 0, kickAttPercent)
end