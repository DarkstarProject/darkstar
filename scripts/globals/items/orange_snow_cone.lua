-----------------------------------------
-- ID: 5713
-- Item: Orange Snow Cone
-- Food Effect: 5 Min, All Races
-----------------------------------------
-- MP % 20 Cap 20
-- AGI -1
-- Int +1
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
	if (target:hasStatusEffect(EFFECT_FOOD)) then
		result = 246;
	end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,300,5713);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_MPP, 20);
    target:addMod(MOD_FOOD_MP_CAP, 20);
    target:addMod(MOD_AGI, -1);
    target:addMod(MOD_INT, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_MPP, 20);
    target:delMod(MOD_FOOD_MP_CAP, 20);
    target:delMod(MOD_AGI, -1);
    target:delMod(MOD_INT, 1);
end;