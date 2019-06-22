-----------------------------------------
-- ID: 18379
-- Item: Vulcan Claymore
-- Additional Effect: Fire Damage
-- Enchantment: Enfire
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 5

    if (math.random(0,99) >= chance) then
        return 0,0,0
    else
        local dmg = math.random(3,10)
        local params = {}
        params.bonusmab = 0
        params.includemab = false
        dmg = addBonusesAbility(player, dsp.magic.ele.FIRE, target, dmg, params)
        dmg = dmg * applyResistanceAddEffect(player,target,dsp.magic.ele.FIRE,0)
        dmg = adjustForTarget(target,dmg,dsp.magic.ele.FIRE)
        dmg = finalMagicNonSpellAdjustments(player,target,dsp.magic.ele.FIRE,dmg)

        local message = dsp.msg.basic.ADD_EFFECT_DMG
        if (dmg < 0) then
            message = dsp.msg.basic.ADD_EFFECT_HEAL
        end

        return dsp.subEffect.FIRE_DAMAGE,message,dmg
    end
end

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local effect = dsp.effect.ENFIRE
    doEnspell(target,target,nil,effect)
end