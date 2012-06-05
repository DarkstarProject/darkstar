-----------------------------------------
-- Spell: Enthunder
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	effect = EFFECT_ENTHUNDER;
	doEnspell(caster,target,spell,effect);
	return effect;
end;