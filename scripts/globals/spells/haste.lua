-----------------------------------------
-- Spell: Haste
-- Composure increases duration 3x
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	duration = 180;

	if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
	   duration = duration * 3;
	end
	power = 15;
	slow = target:getStatusEffect(EFFECT_SLOW);
	haste = target:getStatusEffect(EFFECT_HASTE);
	if(haste ~= nil) then
		if(haste:getPower() <= power) then
			target:delStatusEffect(EFFECT_HASTE);
			target:addStatusEffect(EFFECT_HASTE,power,0,duration);
		else
			spell:setMsg(75);
		end
	elseif(slow ~= nil) then
		if(slow:getPower() > (-1 * power)) then
			target:delStatusEffect(EFFECT_SLOW);	
			target:addStatusEffect(EFFECT_HASTE,power,0,duration);
		else
			spell:setMsg(75);
		end
	else
		target:addStatusEffect(EFFECT_HASTE,power,0,duration);
	end
end;


			
