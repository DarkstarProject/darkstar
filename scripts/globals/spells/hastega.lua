-----------------------------------------
-- Spell: Haste
-- Composure increases duration 3x
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = 180

    if caster:hasStatusEffect(dsp.effect.COMPOSURE) and caster:getID() == target:getID() then
       duration = duration * 3
    end

    local power = 150 -- 15%

    if not target:addStatusEffect(dsp.effect.HASTE, power, 0, duration) then
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

    return dsp.effect.HASTE
end
