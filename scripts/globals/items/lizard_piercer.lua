-----------------------------------------
-- ID: 16853
-- Item: Lizard Piercer
-- Additional Effect vs. lizards: Ice Damage
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onAdditionalEffect(player, target, damage)
    local dmg = player:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT)
    if dmg > 25 then
        dmg = 25 + (dmg - 25) / 2
    end
    
    local params = {}
    params.bonusmab = 0
    params.includemab = false
    dmg = addBonusesAbility(player, dsp.magic.ele.ICE, target, dmg, params)
    dmg = dmg * applyResistanceAddEffect(player, target, dsp.magic.ele.ICE, 0)
    dmg = adjustForTarget(target, dmg, dsp.magic.ele.ICE)
    dmg = finalMagicNonSpellAdjustments(player, target, dsp.magic.ele.ICE, dmg)
    return dsp.subEffect.ICE_DAMAGE, dsp.msg.basic.ADD_EFFECT_DMG, dmg
end