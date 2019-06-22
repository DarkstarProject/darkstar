-----------------------------------------
-- Spell: Death
-- Consumes all MP. Has a chance to knock out the target. If Death fails to knock out the target, it
-- will instead deal darkness damage. Ineffective against undead.
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    spell:setFlag(dsp.magic.spellFlag.IGNORE_SHADOWS)
    return 0
end

function onSpellCast(caster,target,spell)
    if target:isUndead() or target:hasStatusEffect(dsp.effect.MAGIC_SHIELD) or math.random(0,99) < target:getMod(dsp.mod.DEATHRES) then
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
        return 0
    end

    target:setHP(0)
    return 0
end
