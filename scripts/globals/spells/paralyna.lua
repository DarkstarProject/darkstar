-----------------------------------------
-- Spell: Paralyna
-- Removes paralysis from target.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    if (target:getStatusEffect(dsp.effect.PARALYSIS) ~= nil) then
        target:delStatusEffect(dsp.effect.PARALYSIS)
        spell:setMsg(dsp.msg.basic.MAGIC_REMOVE_EFFECT)
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end
    return dsp.effect.PARALYSIS
end
