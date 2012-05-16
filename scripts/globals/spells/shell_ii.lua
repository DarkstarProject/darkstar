-----------------------------------------
-- Spell: Shell II
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	power = 20;
	duration = 1800;
	if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster == target) then
		duration = duration * 3;
	end
	if(target:hasStatusEffect(EFFECT_SHELL) == true) then
		effect = target:getStatusEffect(EFFECT_SHELL);
		cPower = effect:getPower();
		if(cPower > 20) then
			spell:setMsg(75); -- no effect
		else
			target:delStatusEffect(EFFECT_SHELL);
			target:addStatusEffect(EFFECT_SHELL,power,0,duration);	
		end
    else
		target:addStatusEffect(EFFECT_SHELL,power,0,duration);
	end
end;
