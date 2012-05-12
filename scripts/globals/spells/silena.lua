-----------------------------------------
-- Spell: Silena
-- Removes silence and mute from target.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	if(target:getStatusEffect(EFFECT_SILENCE) ~= nil) then
		target:delStatusEffect(EFFECT_SILENCE);
		spell:setMsg(83);
	else
		spell:setMsg(75);
	end
	
	-- mob = target:getTarget();
	-- mob:updateEnmity(caster,150,1);
	return EFFECT_SILENCE;
	
end;