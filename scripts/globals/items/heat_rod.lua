-----------------------------------------
-- ID: 17071
-- Item: Heat Rod
-- Additional Effect: Lightning Damage
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10

    if (math.random(0,99) >= chance) then
        return 0,0,0
    else
        local dmg = math.random(5,20)
        local params = {}
        params.bonusmab = 0
        params.includemab = false
        dmg = addBonusesAbility(player, dsp.magic.ele.LIGHTNING, target, dmg, params)
        dmg = dmg * applyResistanceAddEffect(player,target,dsp.magic.ele.LIGHTNING,0)
        dmg = adjustForTarget(target,dmg,dsp.magic.ele.LIGHTNING)
        dmg = finalMagicNonSpellAdjustments(player,target,dsp.magic.ele.LIGHTNING,dmg)

        local message = dsp.msg.basic.ADD_EFFECT_DMG
        if (dmg < 0) then
            message = dsp.msg.basic.ADD_EFFECT_HEAL
        end

        return dsp.subEffect.LIGHTNING_DAMAGE,message,dmg
    end
end