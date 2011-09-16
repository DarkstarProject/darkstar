-----------------------------------------
-- ID: 4594
-- Item: serving_of_snowy_rolanberry
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Magic % 18
-- Magic Cap 60
-- Intelligence 2
-- Wind Def 5
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0
	if (target:hasStatusEffect(EFFECT_FOOD) == true) then
		result = 246;
	end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_FOOD,0,0,14400,0,4594);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_FOOD_MPP, 18);
	target:addMod(MOD_FOOD_MP_CAP, 60);
	target:addMod(MOD_INT, 2);
	target:addMod(MOD_WATERDEF, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_FOOD_MPP, 18);
	target:delMod(MOD_FOOD_MP_CAP, 60);
	target:delMod(MOD_INT, 2);
	target:delMod(MOD_WATERDEF, 5);
end;
