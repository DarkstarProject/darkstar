-----------------------------------------
-- Spell: Silena
-- Removes silence and mute from target.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	if (target:delStatusEffect(EFFECT_SILENCE)) then
		spell:setMsg(83);
	else
		spell:setMsg(75);
	end
	return EFFECT_SILENCE;
end;