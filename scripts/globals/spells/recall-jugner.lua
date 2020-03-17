-----------------------------------------
-- Spell: Recall-Jugner
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
    if (target:hasKeyItem(tpz.ki.JUGNER_GATE_CRYSTAL) == true) then
            target:addStatusEffectEx(tpz.effect.TELEPORT,0,tpz.teleport.id.JUGNER,0,4.7)
        spell:setMsg(tpz.msg.basic.MAGIC_TELEPORT)
    else
        spell:setMsg(tpz.msg.basic.NO_EFFECT)
    end
    return 0
end
