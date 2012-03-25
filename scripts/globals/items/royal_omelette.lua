-----------------------------------------
-- ID: 4564
-- Item: royal_omelette
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Strength 5
-- Dexterity 2
-- Intelligence -3
-- Mind 4
-- Attack % 22
-- Attack Cap 65
-- Ranged ATT % 22
-- Ranged ATT Cap 65
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0
	if (target:hasStatusEffect(EFFECT_FOOD) == true) then
		result = 246;
	end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_FOOD,0,0,10800,4564);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_STR, 5);
	target:addMod(MOD_DEX, 2);
	target:addMod(MOD_INT, -3);
	target:addMod(MOD_MND, 4);
	target:addMod(MOD_FOOD_ATTP, 22);
	target:addMod(MOD_FOOD_ATT_CAP, 65);
	target:addMod(MOD_FOOD_RATTP, 22);
	target:addMod(MOD_FOOD_RATT_CAP, 65);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_STR, 5);
	target:delMod(MOD_DEX, 2);
	target:delMod(MOD_INT, -3);
	target:delMod(MOD_MND, 4);
	target:delMod(MOD_FOOD_ATTP, 22);
	target:delMod(MOD_FOOD_ATT_CAP, 65);
	target:delMod(MOD_FOOD_RATTP, 22);
	target:delMod(MOD_FOOD_RATT_CAP, 65);
end;
