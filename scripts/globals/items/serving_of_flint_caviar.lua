-----------------------------------------
-- ID: 4276
-- Item: serving_of_flint_caviar
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 10
-- Magic 10
-- Dexterity 4
-- Mind -1
-- Charisma 4
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
	target:addStatusEffect(EFFECT_FOOD,0,0,1800,4276);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_HP, 10);
	target:addMod(MOD_MP, 10);
	target:addMod(MOD_DEX, 4);
	target:addMod(MOD_MND, -1);
	target:addMod(MOD_CHR, 4);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_HP, 10);
	target:delMod(MOD_MP, 10);
	target:delMod(MOD_DEX, 4);
	target:delMod(MOD_MND, -1);
	target:delMod(MOD_CHR, 4);
end;
