-----------------------------------------
-- Spell: Threnody - MOD_ICERES
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	return handleThrenody(caster, target, spell, 50, 60, MOD_ICERES);
end;
