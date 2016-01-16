-----------------------------------------
-- Spell: Blindna
-- Removes blindness from target.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    if (target:delStatusEffect(EFFECT_BLINDNESS)) then
        spell:setMsg(83);
    else
        spell:setMsg(75);
    end
    return EFFECT_BLINDNESS;
end;