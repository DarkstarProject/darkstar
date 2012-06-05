-----------------------------------------
-- Spell: Enfire II
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	effect = EFFECT_ENFIRE_II;
	doEnspell(caster,target,spell,effect);
	return effect;
end;