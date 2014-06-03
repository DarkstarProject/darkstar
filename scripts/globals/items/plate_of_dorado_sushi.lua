-----------------------------------------
-- ID: 5178
-- Item: plate_of_dorado_sushi
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Dexterity 5
-- Accuracy % 15
-- Accuracy Cap 75
-- Ranged ACC % 15
-- Ranged ACC Cap 75
-- Sleep Resist 5
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
	target:addStatusEffect(EFFECT_FOOD,0,0,1800,5178);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_ENMITY, 3);
	target:addMod(MOD_DEX, 5);
	target:addMod(MOD_FOOD_ACCP, 15);
	target:addMod(MOD_FOOD_ACC_CAP, 75);
	target:addMod(MOD_FOOD_RACCP, 15);
	target:addMod(MOD_FOOD_RACC_CAP, 75);
	target:addMod(MOD_SLEEPRES, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_ENMITY, 3);
	target:delMod(MOD_DEX, 5);
	target:delMod(MOD_FOOD_ACCP, 15);
	target:delMod(MOD_FOOD_ACC_CAP, 75);
	target:delMod(MOD_FOOD_RACCP, 15);
	target:delMod(MOD_FOOD_RACC_CAP, 75);
	target:delMod(MOD_SLEEPRES, 5);
end;
