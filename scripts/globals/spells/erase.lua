-----------------------------------------
-- Spell: Erase
--
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

	local effect = target:eraseStatusEffect();

    if (effect == EFFECT_NONE) then
        spell:setMsg(75); -- no effect
    else
        spell:setMsg(341);
    end

    return effect;
end;
