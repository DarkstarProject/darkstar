-----------------------------------------
-- Spell: Teleport-Vahzl
-----------------------------------------
require("scripts/globals/teleports")
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    if (target:hasKeyItem(dsp.ki.VAHZL_GATE_CRYSTAL) == true) then
            target:addStatusEffectEx(dsp.effect.TELEPORT,0,dsp.teleport.id.VAHZL,0,4.7)
        spell:setMsg(dsp.msg.basic.MAGIC_TELEPORT)
    else
        spell:setMsg(dsp.msg.basic.NO_EFFECT)
    end
    return 0
end
