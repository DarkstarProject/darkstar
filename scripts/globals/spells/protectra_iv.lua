-----------------------------------------
-- Spell: Protectra IV
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	power = 40;
	duration = 1800;
	if(target:hasStatusEffect(EFFECT_PROTECT) == true) then
		effect = target:getStatusEffect(EFFECT_PROTECT);
		cPower = effect:getPower();
		if(cPower > 40) then
			spell:setMsg(75); -- no effect
		else
			target:delStatusEffect(EFFECT_PROTECT);
			target:addStatusEffect(EFFECT_PROTECT,power,0,duration);	
		end
    else
		target:addStatusEffect(EFFECT_PROTECT,power,0,duration);
	end
end;
