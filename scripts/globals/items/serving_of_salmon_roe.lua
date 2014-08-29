-----------------------------------------
-- ID: 5218
-- Item: serving_of_salmon_roe
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 8
-- Magic 8
-- Dexterity 2
-- Mind -1
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
	target:addStatusEffect(EFFECT_FOOD,0,0,1800,5218);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_HP, 8);
	target:addMod(MOD_MP, 8);
	target:addMod(MOD_DEX, 2);
	target:addMod(MOD_MND, -1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_HP, 8);
	target:delMod(MOD_MP, 8);
	target:delMod(MOD_DEX, 2);
	target:delMod(MOD_MND, -1);
end;
