-----------------------------------------
-- ID: 5752
-- Item: Pot-au-feu
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Strength 3
-- Agility 3
-- Intelligence -3
-- Ranged Attk % 15 Cap 35 ??
-- Ranged ACC % 15 Cap 35 ??
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
	target:addStatusEffect(EFFECT_FOOD,0,0,1800,5752);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_STR, 3);
	target:addMod(MOD_AGI, 3);
	target:addMod(MOD_INT, -3);
	target:addMod(MOD_FOOD_RATTP, 15);
	target:addMod(MOD_FOOD_RATT_CAP, 35);
	target:addMod(MOD_FOOD_RACCP, 15);
	target:addMod(MOD_FOOD_RACC_CAP, 35);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_STR, 3);
	target:delMod(MOD_AGI, 3);
	target:delMod(MOD_INT, -3);
	target:delMod(MOD_FOOD_RATTP, 15);
	target:delMod(MOD_FOOD_RATT_CAP, 35);
	target:delMod(MOD_FOOD_RACCP, 15);
	target:delMod(MOD_FOOD_RACC_CAP, 35);
end;
