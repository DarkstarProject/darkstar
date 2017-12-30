-----------------------------------------
-- ID: 5647
-- Item: Lik Kabob
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- Dexterity 3
-- Mind -2
-- Accuracy +1
-- Attack 7
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5647);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_DEX, 3);
    target:addMod(MOD_MND, -2);
    target:addMod(MOD_ACC, 1);
    target:addMod(MOD_ATT, 7);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, 3);
    target:delMod(MOD_MND, -2);
    target:delMod(MOD_ACC, 1);
    target:delMod(MOD_ATT, 7);
end;
