-----------------------------------------
-- Spell: Flurry
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)

    if target:addStatusEffect(dsp.effect.FLURRY, 15, 0, 180) then
        spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS)
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

    return dsp.effect.FLURRY
end
