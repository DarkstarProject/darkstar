-----------------------------------------
-- Spell: Viruna
-- Removes disease or plague from target.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    if (target:delStatusEffect(dsp.effects.DISEASE)) then
        spell:setMsg(msgBasic.MAGIC_REMOVE_EFFECT);
        return dsp.effects.DISEASE;
    elseif (target:delStatusEffect(dsp.effects.PLAGUE)) then
        spell:setMsg(msgBasic.MAGIC_REMOVE_EFFECT);
        return dsp.effects.PLAGUE;
    else
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    end

    return 0;
end;
