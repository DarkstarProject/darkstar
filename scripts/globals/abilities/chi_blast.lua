-----------------------------------
-- Ability: Chi Blast
-- Releases Chi to attack an enemy.
-- Obtained: Monk Level 41
-- Recast Time: 3:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0, 0
end

function onUseAbility(player,target,ability)
    local boost = player:getStatusEffect(dsp.effect.BOOST)
    local multiplier = 1.0
    if boost ~= nil then
        multiplier = (boost:getPower()/100) * 4 -- power is the raw % atk boost
    end
    
    local dmg = math.floor(player:getStat(dsp.mod.MND) * (0.5 + (math.random() / 2))) * multiplier

    dmg = utils.stoneskin(target, dmg)
    target:takeDamage(dmg, player, dsp.attackType.SPECIAL, dsp.damageType.ELEMENTAL)
    target:updateEnmityFromDamage(player,dmg)
    target:updateClaim(player)
    player:delStatusEffect(dsp.effect.BOOST)

    return dmg
end
