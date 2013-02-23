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

	power = 150;

	if(target:addStatusEffect(EFFECT_HASTE,power,0,duration) == false) then
		spell:setMsg(75);
	end

	return EFFECT_HASTE;
end;



