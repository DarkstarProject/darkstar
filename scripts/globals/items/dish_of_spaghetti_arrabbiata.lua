-----------------------------------------
-- ID: 5211
-- Item: dish_of_spaghetti_arrabbiata
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Strength 5
-- Vitality 2
-- Intelligence -7
-- Attack % 22
-- Attack Cap 120
-- Store TP 5
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
	if (target:hasStatusEffect(EFFECT_FOOD) == true) then
		result = 246;
	end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_FOOD,0,0,1800,0,5211);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_STR, 5);
	target:addMod(MOD_VIT, 2);
	target:addMod(MOD_INT, -7);
	target:addMod(MOD_FOOD_ATTP, 22);
	target:addMod(MOD_FOOD_ATT_CAP, 120);
	target:addMod(MOD_STORETP, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_STR, 5);
	target:delMod(MOD_VIT, 2);
	target:delMod(MOD_INT, -7);
	target:delMod(MOD_FOOD_ATTP, 22);
	target:delMod(MOD_FOOD_ATT_CAP, 120);
	target:delMod(MOD_STORETP, 5);
end;
