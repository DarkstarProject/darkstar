-----------------------------------------
-- ID: 4440
-- Item: Bowl of Whitefish Stew
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health 10
-- Dexterity 3
-- Mind -3
-- Accuracy 3
-- Ranged ACC % 7
-- Ranged ACC Cap 10
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
	target:addStatusEffect(EFFECT_FOOD,0,0,10800,4440);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_HP, 10);
	target:addMod(MOD_DEX, 3);
	target:addMod(MOD_MND, -3);
	target:addMod(MOD_ACC, 3);
	target:addMod(MOD_FOOD_RACCP, 7);
	target:addMod(MOD_FOOD_RACC_CAP, 10);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_HP, 10);
	target:delMod(MOD_DEX, 3);
	target:delMod(MOD_MND, -3);
	target:delMod(MOD_ACC, 3);
	target:delMod(MOD_FOOD_RACCP, 7);
	target:delMod(MOD_FOOD_RACC_CAP, 10);
end;
