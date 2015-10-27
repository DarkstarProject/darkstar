-----------------------------------------
-- ID: 5604
-- Item: Elshimo Pachira Fruit
-- Effect: 2 Mins, All Races
-----------------------------------------
-- Poison 1HP / 3Tic - 40 Total
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	result = 0
	if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
		result = 246;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_FOOD,0,0,120,5604);
	if (target:hasStatusEffect(EFFECT_POISON) == false) then
		target:addStatusEffect(EFFECT_POISON,1,3,120);
	else
		target:messageBasic(423);
	end
end;
