-----------------------------------------
-- ID: 18853
-- Spirit Maul
-- Additional effect: Light damage
-- Enchantment: TP+100
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
        local dmg = math.random(7,21)
        local params = {}
        params.bonusmab = 0
        params.includemab = false
        dmg = addBonusesAbility(player, dsp.magic.ele.LIGHT, target, dmg, params)
        dmg = dmg * applyResistanceAddEffect(player,target,dsp.magic.ele.LIGHT,0)
        dmg = adjustForTarget(target,dmg,dsp.magic.ele.LIGHT)
        dmg = finalMagicNonSpellAdjustments(player,target,dsp.magic.ele.LIGHT,dmg)

        local message = dsp.msg.basic.ADD_EFFECT_DMG
        if (dmg < 0) then
            message = dsp.msg.basic.ADD_EFFECT_HEAL
        end

        return dsp.subEffect.LIGHT_DAMAGE,message,dmg
    end
end

function onItemCheck(target)
    local result = 0
    if target:getFreeSlotsCount() == 0 then
        result = dsp.msg.basic.ITEM_NO_USE_INVENTORY
    end
    return result
end

function onItemUse(target)
    target:addTP(100)
end