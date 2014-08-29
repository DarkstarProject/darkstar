-----------------------------------------
-- ID: 5664
-- Item: plate_of_salmon_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Strength 2
-- Accuracy % 15
-- Ranged ACC % 15
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
	target:addStatusEffect(EFFECT_FOOD,0,0,3600,5663);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_STR, 2);
	target:addMod(MOD_FOOD_ACCP, 15);
	target:addMod(MOD_FOOD_ACC_CAP, 999);
	target:addMod(MOD_FOOD_RACCP, 15);
	target:addMod(MOD_FOOD_RACC_CAP, 999);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_STR, 1);
	target:delMod(MOD_FOOD_ACCP, 15);
	target:delMod(MOD_FOOD_ACC_CAP, 999);
	target:delMod(MOD_FOOD_RACCP, 15);
	target:delMod(MOD_FOOD_RACC_CAP, 999);
end;
