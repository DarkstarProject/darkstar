-----------------------------------------
-- ID: 5750
-- Item: Bowl of goulash
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Vitality 3
-- Intelligence -2
-- Defense +10% 
-- Accuracy +10%
-- Arcana Killer
-- Store TP +1 
	
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
local result = 0;
	if (target:hasStatusEffect(EFFECT_FOOD) == true) then
		result = 246;
	end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_FOOD,0,0,10800,5750);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_VIT, 3);
	target:addMod(MOD_INT, -2);
	target:addMod(MOD_FOOD_DEFP, 10);
	target:addMod(MOD_FOOD_ACCP, 10);
	target:addMod(MOD_ARCANA_KILLER, 5);
	target:addMod(MOD_STORETP, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_VIT, 3);
	target:delMod(MOD_INT, -2);
	target:delMod(MOD_FOOD_DEFP, 10);
	target:delMod(MOD_FOOD_ACCP, 10);
	target:delMod(MOD_ARCANA_KILLER, 5);
	target:delMod(MOD_STORETP, 1);
end;