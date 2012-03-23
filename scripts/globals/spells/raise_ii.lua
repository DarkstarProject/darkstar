-----------------------------------------
-- Spell: Raise
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	target:sendRaise(2);
end;