-----------------------------------------
-- ID: 4472
-- Item: crayfish
-- Food Effect: 5Min, Mithra only
-----------------------------------------
-- Dexterity -3
-- Vitality 1
-- defense +10% (unknown cap)
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getRace() ~= 7) then
        result = 247;
    end
    if (target:getMod(MOD_EAT_RAW_FISH) == 1) then
        result = 0;
    end
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,300,4472);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, -3);
    target:addMod(MOD_VIT, 1);
    target:addMod(MOD_FOOD_DEFP, 10);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_DEX, -3);
    target:delMod(MOD_VIT, 1);
    target:delMod(MOD_FOOD_DEFP, 10);
end;
