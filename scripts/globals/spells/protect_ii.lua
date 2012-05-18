-----------------------------------------
-- Spell: Protect II
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	power = 20;
	duration = 1800;
	if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
		duration = duration * 3;
	end	
	if(target:hasStatusEffect(EFFECT_PROTECT) == true) then
		effect = target:getStatusEffect(EFFECT_PROTECT);
		cPower = effect:getPower();
		if(cPower > 20) then
			spell:setMsg(75); -- no effect
		else
			target:delStatusEffect(EFFECT_PROTECT);
			target:addStatusEffect(EFFECT_PROTECT,power,0,duration);	
		end
    else
		target:addStatusEffect(EFFECT_PROTECT,power,0,duration);
	end
end;
