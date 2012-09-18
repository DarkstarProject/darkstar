-----------------------------------------
-- Spell: Protectra II
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	local power = 40;
	local duration = 1800;

	local typeEffect = EFFECT_PROTECT;
	if(target:hasStatusEffect(typeEffect) == true) then
		local effect = target:getStatusEffect(typeEffect);
		local cPower = effect:getPower();
		if(cPower > power) then
			spell:setMsg(75); -- no effect
		else
			target:delStatusEffect(typeEffect);
			target:addStatusEffect(typeEffect,power,0,duration);	
		end
    else
		target:addStatusEffect(typeEffect,power,0,duration);
	end
end;
