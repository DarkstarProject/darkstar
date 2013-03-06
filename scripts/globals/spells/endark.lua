-----------------------------------------
-- Spell: Endark
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	effect = EFFECT_ENDARK;
	doEnspell(caster,target,spell,effect);
	return effect;
end;