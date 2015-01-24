-----------------------------------------
-- ID: 6064
-- Item: Queen's Crown
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- MP % 6 Cap 55
-- Intelligence 4
-- Mind 3
-- Charisma 2
-- Strength -2
-- MAB 7
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,6064);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_MPP, 6);
    target:addMod(MOD_FOOD_MP_CAP, 55);
    target:addMod(MOD_INT, 4);
    target:addMod(MOD_MND, 5);
    target:addMod(MOD_CHR, 2);
    target:addMod(MOD_STR, -2);
    target:addMod(MOD_MATT, 7);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_MPP, 6);
    target:delMod(MOD_FOOD_MP_CAP, 55);
    target:delMod(MOD_INT, 4);
    target:delMod(MOD_MND, 3);
    target:delMod(MOD_CHR, 2);
    target:delMod(MOD_STR, -2);
    target:delMod(MOD_MATT, 7);
end;