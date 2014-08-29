-----------------------------------------
-- ID: 5176
-- Item: plate_of_bream_sushi
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Dexterity 6
-- Vitality 5
-- Accuracy % 16
-- Ranged ACC % 16
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
	target:addStatusEffect(EFFECT_FOOD,0,0,1800,5176);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_DEX, 6);
	target:addMod(MOD_VIT, 5);
	target:addMod(MOD_ACCP, 16);
	target:addMod(MOD_RACCP, 16);
	target:addMod(MOD_SLEEPRES, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_DEX, 6);
	target:delMod(MOD_VIT, 5);
	target:delMod(MOD_ACCP, 16);
	target:delMod(MOD_RACCP, 16);
	target:delMod(MOD_SLEEPRES, 5);
end;
