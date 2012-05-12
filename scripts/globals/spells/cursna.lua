-----------------------------------------
-- Spell: Cursna
-- Removes curse and bane from target.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	curse = target:getStatusEffect(EFFECT_CURSE);
	bane = target:getStatusEffect(EFFECT_BANE);
	
	if(curse ~= nil and bane ~= nil) then
		target:delStatusEffect(EFFECT_CURSE);
		target:delStatusEffect(EFFECT_BANE);
		final = EFFECT_CURSE;
		spell:setMsg(83);
	elseif(curse ~= nil) then
		target:delStatusEffect(EFFECT_CURSE);
		final = EFFECT_CURSE;
		spell:setMsg(83);
	elseif(bane ~= nil) then
		target:delStatusEffect(EFFECT_BANE);
		final = EFFECT_BANE;
		spell:setMsg(83);
	else
		spell:setMsg(75);
	end
	
	-- mob = target:getTarget();
	-- mob:updateEnmity(caster,150,1);
	return final;
	
end;