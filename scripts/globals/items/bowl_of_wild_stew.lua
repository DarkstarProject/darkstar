-----------------------------------------
-- ID: 4589
-- Item: Bowl of Wild Stew
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Strength 4
-- Agility 1
-- Vitality 2
-- Intelligence -2
-- Attack % 25
-- Attack Cap 50
-- Ranged ATT % 25
-- Ranged ATT Cap 50
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
	target:addStatusEffect(EFFECT_FOOD,0,0,14400,4589);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_STR, 4);
	target:addMod(MOD_AGI, 1);
	target:addMod(MOD_VIT, 2);
	target:addMod(MOD_INT, -2);
	target:addMod(MOD_FOOD_ATTP, 25);
	target:addMod(MOD_FOOD_ATT_CAP, 50);
	target:addMod(MOD_FOOD_RATTP, 25);
	target:addMod(MOD_FOOD_RATT_CAP, 50);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_STR, 4);
	target:delMod(MOD_AGI, 1);
	target:delMod(MOD_VIT, 2);
	target:delMod(MOD_INT, -2);
	target:delMod(MOD_FOOD_ATTP, 25);
	target:delMod(MOD_FOOD_ATT_CAP, 50);
	target:delMod(MOD_FOOD_RATTP, 25);
	target:delMod(MOD_FOOD_RATT_CAP, 50);
end;
