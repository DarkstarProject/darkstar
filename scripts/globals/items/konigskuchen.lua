-----------------------------------------
-- ID: 5614
-- Item: konigskuchen
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health 8
-- Magic % 3
-- Magic Cap 13
-- Intelligence 2
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
	target:addStatusEffect(EFFECT_FOOD,0,0,10800,0,5614);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_HP, 8);
	target:addMod(MOD_FOOD_MPP, 3);
	target:addMod(MOD_FOOD_MP_CAP, 13);
	target:addMod(MOD_INT, 2);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_HP, 8);
	target:delMod(MOD_FOOD_MPP, 3);
	target:delMod(MOD_FOOD_MP_CAP, 13);
	target:delMod(MOD_INT, 2);
end;
