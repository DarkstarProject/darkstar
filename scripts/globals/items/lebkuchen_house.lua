-----------------------------------------
-- ID: 5616
-- Item: Lebkuchen House
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- MP 10% Cap 45
-- Intelligence 3
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
	target:addStatusEffect(EFFECT_FOOD,0,0,10800,5616);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_FOOD_MPP, 10);
	target:addMod(MOD_FOOD_MP_CAP, 45);
	target:addMod(MOD_INT, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_FOOD_MPP, 10);
	target:delMod(MOD_FOOD_MP_CAP, 45);
	target:delMod(MOD_INT, 3);
end;
