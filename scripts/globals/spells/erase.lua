-----------------------------------------
-- Spell: Erase
--
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local effect = target:eraseStatusEffect();

    if (effect == EFFECT_NONE) then
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT); -- no effect
    else
        spell:setMsg(msgBasic.MAGIC_ERASE);
    end

    return effect;
end;
