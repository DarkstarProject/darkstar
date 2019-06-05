-----------------------------------------
-- ID: 18276, 18277, 18639, 18653, 18667, 18748, 19841, 20645, 20646, 20685
-- Item: Excalibur
-- Additional Effect: Damage proportionate to current HP (25% Current HP)
-----------------------------------------
require("scripts/globals/msg")
require("scripts/globals/status")
require("scripts/globals/weaponskills")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 10

    if math.random(100) <= chance then
        local finalDMG = math.floor(player.getHP(player) / 4)
        if finalDMG > 0 then
            local damageType = player:getWeaponDamageType(dsp.slot.MAIN)
            local physicalResist = target:getMod(dsp.mod.SLASHRES) / 1000
            finalDMG = finalDMG * physicalResist
            finalDMG = target:physicalDmgTaken(finalDMG, damageType)
            finalDMG = finalDMG - target:getMod(dsp.mod.PHALANX)
            finalDMG = utils.clamp(finalDMG, 0, 99999)
            finalDMG = utils.stoneskin(target, finalDMG)
            target:takeDamage(finalDMG, player, dsp.attackType.PHYSCIAL, damageType)
            return dsp.subEffect.LIGHT_DAMAGE, dsp.msg.basic.ADD_EFFECT_DMG, finalDMG
        end
    end

    return 0, 0, 0
end