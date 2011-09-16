-----------------------------------------
-- ID: 4556
-- Item: serving_of_icecap_rolanberry
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Magic % 19
-- Magic Cap 55
-- Intelligence 2
-- Wind Def 5
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
	target:addStatusEffect(EFFECT_FOOD,0,0,10800,0,4556);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_FOOD_MPP, 19);
	target:addMod(MOD_FOOD_MP_CAP, 55);
	target:addMod(MOD_INT, 2);
	target:addMod(MOD_WINDDEF, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_FOOD_MPP, 19);
	target:delMod(MOD_FOOD_MP_CAP, 55);
	target:delMod(MOD_INT, 2);
	target:delMod(MOD_WINDDEF, 5);
end;
