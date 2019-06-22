-----------------------------------------
-- Spell: Burn
-- Deals fire damage that lowers an enemy's intelligence and gradually reduces its HP.
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)

    if (target:getStatusEffect(dsp.effect.DROWN) ~= nil) then
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT) -- no effect
    else
        local dINT = caster:getStat(dsp.mod.INT)-target:getStat(dsp.mod.INT)
        local params = {}
        params.diff = nil
        params.attribute = dsp.mod.INT
        params.skillType = 36
        params.bonus = 0
        params.effect = nil
        local resist = applyResistance(caster, target, spell, params)
        if (resist <= 0.125) then
            spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
        else
            if (target:getStatusEffect(dsp.effect.FROST) ~= nil) then
                target:delStatusEffect(dsp.effect.FROST)
            end
            local sINT = caster:getStat(dsp.mod.INT)
            local DOT = getElementalDebuffDOT(sINT)
            local effect = target:getStatusEffect(dsp.effect.BURN)
            local noeffect = false
            if (effect ~= nil) then
                if (effect:getPower() >= DOT) then
                    noeffect = true
                end
            end
            if (noeffect) then
                spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT) -- no effect
            else
                if (effect ~= nil) then
                    target:delStatusEffect(dsp.effect.BURN)
                end
                spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB)
                local duration = math.floor(ELEMENTAL_DEBUFF_DURATION * resist)
                target:addStatusEffect(dsp.effect.BURN,DOT, 3, ELEMENTAL_DEBUFF_DURATION)
            end
        end
    end

    return dsp.effect.BURN

end
