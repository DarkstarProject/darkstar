-----------------------------------------
-- ID: 4456
-- Item: boiled_crab
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Vitality 2
-- defense % 27
-- defense % 50
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
	target:addStatusEffect(EFFECT_FOOD,0,0,1800,0,4456);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_VIT, 2);
	target:addMod(MOD_FOOD_DEFP, 27);
	target:addMod(MOD_FOOD_DEF_CAP, 50);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_VIT, 2);
	target:delMod(MOD_FOOD_DEFP, 27);
	target:delMod(MOD_FOOD_DEF_CAP, 50);
end;
