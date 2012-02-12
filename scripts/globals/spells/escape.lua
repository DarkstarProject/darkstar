-----------------------------------------
-- Spell: Escape
-----------------------------------------

require("scripts/globals/teleports");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	return (toEscape(target, target:getZone()));
end;
