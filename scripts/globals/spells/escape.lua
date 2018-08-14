-----------------------------------------
-- Spell: Escape
-----------------------------------------
require("scripts/globals/teleports")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    spell:setMsg(dsp.msg.basic.MAGIC_TELEPORT)
    target:addStatusEffectEx(dsp.effect.TELEPORT,0,dsp.teleport.id.ESCAPE,0,4)

    return 0
end
