-----------------------------------------
-- ID: 5652
-- Item: plate_of_anchovies
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Dexterity 1
-- Mind -3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,180,5652);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_DEX, 1);
    target:addMod(MOD_MND, -3);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, 1);
    target:delMod(MOD_MND, -3);
end;
