-----------------------------------------
-- ID: 16943
-- Item: Ascalaon
-- Additional Effect vs. dragons: Light Damage
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onAdditionalEffect(player, target, damage)
    local dmg = player:getStat(dsp.mod.MND) - target:getStat(dsp.mod.MND)
    if dmg > 25 then
        dmg = 25 + (dmg - 25) / 2
    end
    
    local params = {}
    params.bonusmab = 0
    params.includemab = false
    dmg = addBonusesAbility(player, dsp.magic.ele.LIGHT, target, dmg, params)
    dmg = dmg * applyResistanceAddEffect(player, target, dsp.magic.ele.LIGHT, 0)
    dmg = adjustForTarget(target, dmg, dsp.magic.ele.LIGHT)
    dmg = finalMagicNonSpellAdjustments(player, target, dsp.magic.ele.LIGHT, dmg)
    return dsp.subEffect.LIGHT_DAMAGE, dsp.msg.basic.ADD_EFFECT_DMG, dmg
end