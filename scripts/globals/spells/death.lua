-----------------------------------------
-- Spell: Death
-- Instant K.O.
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    if (target:hasStatusEffect(dsp.effect.MAGIC_SHIELD) or math.random(0,99) < target:getMod(dsp.mod.DEATHRES)) then
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
        return 0
    end

    -- falls to the ground
    spell:setMsg(dsp.msg.basic.FALL_TO_GROUND)
    target:setHP(0)

    return 0
end
