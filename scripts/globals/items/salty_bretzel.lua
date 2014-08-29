-----------------------------------------
-- ID: 5182
-- Item: salty_bretzel
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Magic % 8
-- Magic Cap 60
-- Vitality 2
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
	target:addStatusEffect(EFFECT_FOOD,0,0,300,5182);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_FOOD_MPP, 8);
	target:addMod(MOD_FOOD_MP_CAP, 60);
	target:addMod(MOD_VIT, 2);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_FOOD_MPP, 8);
	target:delMod(MOD_FOOD_MP_CAP, 60);
	target:delMod(MOD_VIT, 2);
end;
