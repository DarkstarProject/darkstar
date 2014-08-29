-----------------------------------------
-- ID: 5217
-- Item: serving_of_salmon_eggs
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Health 6
-- Magic 6
-- Dexterity 2
-- Mind -3
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
	target:addStatusEffect(EFFECT_FOOD,0,0,300,5217);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_HP, 6);
	target:addMod(MOD_MP, 6);
	target:addMod(MOD_DEX, 2);
	target:addMod(MOD_MND, -3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_HP, 6);
	target:delMod(MOD_MP, 6);
	target:delMod(MOD_DEX, 2);
	target:delMod(MOD_MND, -3);
end;
