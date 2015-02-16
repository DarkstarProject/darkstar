-----------------------------------------
-- ID: 5163
-- Item: plate_of_sole_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health 20
-- Strength 5
-- Dexterity 6
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
	target:addStatusEffect(EFFECT_FOOD,0,0,3600,5163);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_HPP, 20);
	target:addMod(MOD_MPP, 20);
	target:addMod(MOD_STR, 10);
	target:addMod(MOD_DEX, 10);
	target:addMod(MOD_VIT, 10);
	target:addMod(MOD_AGI, 10);
	target:addMod(MOD_INT, 10);
	target:addMod(MOD_MND, 10);
	target:addMod(MOD_CHR, 10);
	target:addMod(MOD_ATT, 10);
	target:addMod(MOD_MATT, 10);
	target:addMod(MOD_MACC, 10);
	target:addMod(MOD_FOOD_ACCP, 30);
	target:addMod(MOD_FOOD_RACCP, 30);
	target:addMod(MOD_SLEEPRES, 25);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_HPP, 20);
	target:delMod(MOD_MPP, 20);
	target:delMod(MOD_STR, 10);
	target:delMod(MOD_DEX, 10);
	target:delMod(MOD_VIT, 10);
	target:delMod(MOD_AGI, 10);
	target:delMod(MOD_INT, 10);
	target:delMod(MOD_MND, 10);
	target:delMod(MOD_CHR, 10);
	target:delMod(MOD_ATT, 10);
	target:delMod(MOD_MATT, 10);
	target:delMod(MOD_MACC, 10);
	target:delMod(MOD_FOOD_ACCP, 30);
	target:delMod(MOD_FOOD_RACCP, 30);
	target:delMod(MOD_SLEEPRES, 25);
end;