-----------------------------------------
-- Spell: Threnody - MOD_LIGHTRES
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
	return handleThrenody(caster, target, spell, 50, 60, MOD_LIGHTRES);
end;
