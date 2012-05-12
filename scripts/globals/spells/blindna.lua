-----------------------------------------
-- Spell: Blindna
-- Removes blindness from target.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	if(target:getStatusEffect(EFFECT_BLINDNESS) ~= nil) then
		target:delStatusEffect(EFFECT_BLINDNESS);
		spell:setMsg(83);
	else
		spell:setMsg(75);
	end
	
	-- mob = target:getTarget();
	-- mob:updateEnmity(caster,150,1);
	return EFFECT_BLINDNESS;
	
end;