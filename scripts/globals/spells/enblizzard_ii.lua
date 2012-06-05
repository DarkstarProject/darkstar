-----------------------------------------
-- Spell: Enblizzard II
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	effect = EFFECT_ENBLIZZARD_II;
	doEnspell(caster,target,spell,effect);
	return effect;
end;