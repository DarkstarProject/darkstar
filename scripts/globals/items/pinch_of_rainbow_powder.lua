-----------------------------------------
--	ID: 5362
--	Rainbow Powder
--	When applied, it makes things invisible.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
	if (target:hasStatusEffect(EFFECT_MEDICINE) == true) then
		result = 111;
	end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	if (not target:hasStatusEffect(EFFECT_INVISIBLE)) then
		target:addStatusEffect(EFFECT_INVISIBLE,0,10,180);
	end
	target:addStatusEffect(EFFECT_MEDICINE,0,0,180);
end;
