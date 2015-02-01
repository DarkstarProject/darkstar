-----------------------------------------
-- ID: 5679
-- Item: Cathedral Salad
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- MP 15% Cap 90
-- Agility 7
-- Mind 7
-- Strength -5
-- Vitality -5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5679);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_MPP, 15);
    target:addMod(MOD_FOOD_MP_CAP, 90);
    target:addMod(MOD_AGI, 7);
    target:addMod(MOD_MND, 7);
    target:addMod(MOD_STR, -5);
    target:addMod(MOD_VIT, -5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_MPP, 15);
    target:delMod(MOD_FOOD_MP_CAP, 90);
    target:delMod(MOD_AGI, 7);
    target:delMod(MOD_MND, 7);
    target:delMod(MOD_STR, -5);
    target:delMod(MOD_VIT, -5);
end;
