-----------------------------------------
-- ID: 19315
-- Item: Erebus's Lance
-- Additional Effect vs. Empty: Damage varies with TP
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 5
    
    if math.random(100) <= chance then
        local dmg = math.floor(player:getTP() / 14)
        return dsp.subEffect.LIGHT_DAMAGE, dsp.msg.basic.ADD_EFFECT_DMG, dmg
    end
    
    return 0, 0, 0
end