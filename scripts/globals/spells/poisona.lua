-----------------------------------------
-- Spell: Poisona
-- Removes poison from target.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	if (target:delStatusEffect(EFFECT_POISON)) then
		spell:setMsg(83);
	else
		spell:setMsg(75);
	end
	return EFFECT_POISON;
end;