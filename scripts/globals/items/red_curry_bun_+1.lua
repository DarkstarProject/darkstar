-----------------------------------------
-- ID: 5765
-- Item: red_curry_bun_+1
-- Food Effect: 60 Min, All Races
-----------------------------------------
-- Health 35
-- Strength 7
-- Agility 3
-- Attack % 24.7
-- Attack Cap 150
-- Ranged ATT % 24.7
-- Ranged ATT Cap 150

-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
		result = 246;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_FOOD,0,0,3600,5765);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_HPP, 25);
	target:addMod(MOD_AGI, 20);
	target:addMod(MOD_DEX, 20);
	target:addMod(MOD_FOOD_ACCP, 10);
	target:addMod(MOD_FOOD_RATTP, 50);
	target:addMod(MOD_FOOD_RATT_CAP, 500);
	target:addMod(MOD_FOOD_RACCP, 20);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_HPP, 25);
	target:delMod(MOD_AGI, 20);
	target:delMod(MOD_DEX, 20);
	target:delMod(MOD_FOOD_ACCP, 10);
	target:delMod(MOD_FOOD_RATTP, 50);
	target:delMod(MOD_FOOD_RATT_CAP, 500);
	target:delMod(MOD_FOOD_RACCP, 20);
end;