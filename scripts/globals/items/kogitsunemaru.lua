-----------------------------------------
-- ID: 18428
-- Item: Kogitsunemaru
-- Additional Effect vs. vermin: HP Drain
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 10
    if math.random(100) <= chance then
        local hp = 30 + (player:getMainLvl() - target:getMainLvl()) / 2 -- Guesstimate
        player:addHP(hp)
        return dsp.subEffect.HP_DRAIN, dsp.msg.basic.ADD_EFFECT_HP_DRAIN, hp
    end
    
    return 0, 0, 0
end