-----------------------------------------
-- Spell: Viruna
-- Removes disease and plague from target.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	local final = 0;
	spell:setMsg(75);
	
	if(target:delStatusEffect(EFFECT_DISEASE)) then
		spell:setMsg(83);
		final = EFFECT_DISEASE;
	end
	if(target:delStatusEffect(EFFECT_PLAGUE)) then
		spell:setMsg(83);
		final = EFFECT_PLAGUE;
	end
	return final;
	
end;