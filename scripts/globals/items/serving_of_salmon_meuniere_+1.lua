-----------------------------------------
-- ID: 4347
-- Item: serving_of_salmon_meuniere_+1
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Dexterity 2
-- Mind -2
-- Ranged ACC % 7
-- Ranged ACC Cap 15
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,4347);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_DEX, 2);
    target:addMod(MOD_MND, -2);
    target:addMod(MOD_FOOD_RACCP, 7);
    target:addMod(MOD_FOOD_RACC_CAP, 15);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, 2);
    target:delMod(MOD_MND, -2);
    target:delMod(MOD_FOOD_RACCP, 7);
    target:delMod(MOD_FOOD_RACC_CAP, 15);
end;
