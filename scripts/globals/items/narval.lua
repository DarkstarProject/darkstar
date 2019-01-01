-----------------------------------------
-- ID: 16884
-- Item: Narval
-- Additional Effect vs. undead: Water Damage
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 10
    
    if math.random(100) <= chance then
        local dmg = player:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT)
        if dmg > 40 then
            dmg = 40 + (dmg - 40) / 2
        end
        
        local params = {}
        params.bonusmab = 0
        params.includemab = false
        dmg = addBonusesAbility(player, dsp.magic.ele.WATER, target, dmg, params)
        dmg = dmg * applyResistanceAddEffect(player, target, dsp.magic.ele.WATER, 0)
        dmg = adjustForTarget(target, dmg, dsp.magic.ele.WATER)
        dmg = finalMagicNonSpellAdjustments(player, target, dsp.magic.ele.WATER, dmg)
        return dsp.subEffect.WATER_DAMAGE, dsp.msg.basic.ADD_EFFECT_DMG, dmg
    end
    
    return 0, 0, 0
end