-----------------------------------------
-- ID: 5764
-- Item: black_curry_bun+1
-- Food Effect: 60 minutes, All Races
-----------------------------------------
-- Intelligence +1 
-- Vitality +4
-- Dexterity +2
-- Defense +~16%

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
	target:addStatusEffect(EFFECT_FOOD,0,0,3600,5764);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_HPP, 40);
	target:addMod(MOD_VIT, 20);
	target:addMod(MOD_ACCP, 15);
	target:addMod(MOD_ENMITY, 20);
	target:addMod(MOD_FOOD_DEFP, 25);
	target:addMod(MOD_FOOD_DEF_CAP, 250);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_HPP, 40);
	target:delMod(MOD_VIT, 20);
	target:delMod(MOD_ACCP, 15);
	target:delMod(MOD_ENMITY, 20);
	target:delMod(MOD_FOOD_DEFP, 25);
	target:delMod(MOD_FOOD_DEF_CAP, 250); 
end;