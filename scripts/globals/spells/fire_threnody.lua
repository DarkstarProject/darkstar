-----------------------------------------
-- Spell: Threnody - MOD_FIRERES
-----------------------------------------
package.loaded["scripts/globals/magic"] = nil;
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	print("Fire Threnody\n");
	return handleThrenody(caster, target, spell, 50, 60, MOD_FIRERES);
end;
