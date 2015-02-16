-----------------------------------------
-- ID: 5761
-- Item: Kohlrouladen +1
-- Food Effect: 2 Hours, All Races
-----------------------------------------
-- Strength 4
-- Agility 4
-- Intelligence -4
-- Ranged Accuracy 10%  Cap 70
-- Ranged Attack 8% Cap 65
-- Enmity -4
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
	target:addStatusEffect(EFFECT_FOOD,0,0,3600,5761);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_STR, 4);
	target:addMod(MOD_AGI, 4);
	target:addMod(MOD_INT, -4);
	target:addMod(MOD_FOOD_RACCP, 15);
	target:addMod(MOD_FOOD_RACC_CAP, 70);
	target:addMod(MOD_FOOD_RATTP, 10);
	target:addMod(MOD_FOOD_RATT_CAP, 65);
	target:addMod(MOD_ENMITY, -4);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_STR, 4);
	target:delMod(MOD_AGI, 4);
	target:delMod(MOD_INT, -4);
	target:delMod(MOD_FOOD_RACCP, 15);
	target:delMod(MOD_FOOD_RACC_CAP, 70);
	target:delMod(MOD_FOOD_RATTP, 10);
	target:delMod(MOD_FOOD_RATT_CAP, 65);
	target:delMod(MOD_ENMITY, -4);
end;
