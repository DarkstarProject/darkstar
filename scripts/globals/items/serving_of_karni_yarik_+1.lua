-----------------------------------------
-- ID: 5589
-- Item: serving_of_karni_yarik_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Agility 3
-- Vitality -1
-- Attack % 20
-- Attack Cap 65
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
	target:addStatusEffect(EFFECT_FOOD,0,0,3600,5589);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_AGI, 3);
	target:addMod(MOD_VIT, -1);
	target:addMod(MOD_FOOD_ATTP, 20);
	target:addMod(MOD_FOOD_ATT_CAP, 65);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_AGI, 3);
	target:delMod(MOD_VIT, -1);
	target:delMod(MOD_FOOD_ATTP, 20);
	target:delMod(MOD_FOOD_ATT_CAP, 65);
end;
