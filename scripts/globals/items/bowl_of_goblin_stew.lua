-----------------------------------------
-- ID: 4465
-- Item: bowl_of_goblin_stew
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- Dexterity -4
-- Attack % 15.5
-- Ranged Attack % 15.5
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
	target:addStatusEffect(EFFECT_FOOD,0,0,10800,4465);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_DEX, -4);
	target:addMod(MOD_FOOD_ATTP, 15.5);
	target:addMod(MOD_FOOD_ATT_CAP, 80);
	target:addMod(MOD_FOOD_RATTP, 15.5);
	target:addMod(MOD_FOOD_RATT_CAP, 80);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_DEX, -4);
	target:delMod(MOD_FOOD_ATTP, 15.5);
	target:delMod(MOD_FOOD_ATT_CAP, 80);
	target:delMod(MOD_FOOD_RATTP, 15.5);
	target:delMod(MOD_FOOD_RATT_CAP, 80);
end;
