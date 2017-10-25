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
    if (target:delStatusEffect(EFFECT_DISEASE)) then
        spell:setMsg(msgBasic.MAGIC_REMOVE_EFFECT);
        return EFFECT_DISEASE;
    elseif (target:delStatusEffect(EFFECT_PLAGUE)) then
        spell:setMsg(msgBasic.MAGIC_REMOVE_EFFECT);
        return EFFECT_PLAGUE;
    else
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    end

    return 0;
end;
