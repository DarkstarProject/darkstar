-----------------------------------------
-- Spell: Viruna
-- Removes disease and plague from target.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	desease = target:getStatusEffect(EFFECT_DISEASE);
	plague = target:getStatusEffect(EFFECT_PLAGUE);
	
	if(desease ~= nil and plague ~= nil) then
		target:delStatusEffect(EFFECT_DISEASE);
		target:delStatusEffect(EFFECT_PLAGUE);
		final = EFFECT_DISEASE;
		spell:setMsg(83);
	elseif(desease ~= nil) then
		target:delStatusEffect(EFFECT_DISEASE);
		final = EFFECT_DISEASE;
		spell:setMsg(83);
	elseif(plague ~= nil) then
		target:delStatusEffect(EFFECT_PLAGUE);
		final = EFFECT_PLAGUE;
		spell:setMsg(83);
	else
		spell:setMsg(75);
	end
	
	-- mob = target:getTarget();
	-- mob:updateEnmity(caster,150,1);
	return final;
	
end;