-----------------------------------------
-- Spell: Cursna
-- Removes curse and bane from target.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local curse = target:getStatusEffect(dsp.effect.CURSE_I)
    local curse2 = target:getStatusEffect(dsp.effect.CURSE_II)
    local bane = target:getStatusEffect(dsp.effect.BANE)
    local bonus = caster:getMod(dsp.mod.ENHANCES_CURSNA) + target:getMod(dsp.mod.ENHANCES_CURSNA_RCVD)
    local power = 25*((100+bonus)/100) -- This 25 is temp until the skill calculation is in.

    spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    if (target:hasStatusEffect(dsp.effect.DOOM) and power > math.random(1, 100)) then
        -- remove doom
        final = dsp.effect.DOOM
        target:delStatusEffect(dsp.effect.DOOM)
        spell:setMsg(dsp.msg.basic.NARROWLY_ESCAPE)
    elseif (curse ~= nil and curse2 ~= nil and bane ~= nil) then
        target:delStatusEffect(dsp.effect.CURSE_I)
        target:delStatusEffect(dsp.effect.CURSE_II)
        target:delStatusEffect(dsp.effect.BANE)
        final = dsp.effect.CURSE_II
        spell:setMsg(dsp.msg.basic.MAGIC_REMOVE_EFFECT)
    elseif (curse ~= nil and bane ~= nil) then
        target:delStatusEffect(dsp.effect.CURSE_I)
        target:delStatusEffect(dsp.effect.BANE)
        final = dsp.effect.CURSE_I
        spell:setMsg(dsp.msg.basic.MAGIC_REMOVE_EFFECT)
    elseif (curse2 ~= nil and bane ~= nil) then
        target:delStatusEffect(dsp.effect.CURSE_II)
        target:delStatusEffect(dsp.effect.BANE)
        final = dsp.effect.CURSE_II
        spell:setMsg(dsp.msg.basic.MAGIC_REMOVE_EFFECT)
    elseif (curse ~= nil) then
        target:delStatusEffect(dsp.effect.CURSE_I)
        final = dsp.effect.CURSE_I
        spell:setMsg(dsp.msg.basic.MAGIC_REMOVE_EFFECT)
    elseif (curse2 ~= nil) then
        target:delStatusEffect(dsp.effect.CURSE_II)
        final = dsp.effect.CURSE_II
        spell:setMsg(dsp.msg.basic.MAGIC_REMOVE_EFFECT)
    elseif (bane ~= nil) then
        target:delStatusEffect(dsp.effect.BANE)
        final = dsp.effect.BANE
        spell:setMsg(dsp.msg.basic.MAGIC_REMOVE_EFFECT)
    end

    return final
end
