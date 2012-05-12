-----------------------------------------
-- Spell: Stona
-- Removes petrification from target.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	if(target:getStatusEffect(EFFECT_PETRIFICATION) ~= nil) then
		target:delStatusEffect(EFFECT_PETRIFICATION);
		spell:setMsg(83);
	else
		spell:setMsg(75);
	end
	
	-- mob = target:getTarget();
	-- mob:updateEnmity(caster,150,1);
	return EFFECT_PETRIFICATION;
	
end;