-----------------------------------------
-- Spell: Shellra III
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	power = -48;
	duration = 1800;	
	
	if(target:hasStatusEffect(EFFECT_SHELL) == true) then
		effect = target:getStatusEffect(EFFECT_SHELL);
		cPower = effect:getPower();
		if(cPower < -48) then
			spell:setMsg(75); -- no effect
		else
			target:delStatusEffect(EFFECT_SHELL);
			target:addStatusEffect(EFFECT_SHELL,power,0,duration);	
		end
    else
		target:addStatusEffect(EFFECT_SHELL,power,0,duration);
	end
end;
