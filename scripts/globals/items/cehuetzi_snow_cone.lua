-----------------------------------------
-- ID: 6223
-- Item: Cehuetzi snow cone
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- MP +20% (cap 100)
-- INT +5
-- MND +5
-- Magic Atk. Bonus +13
-- Lizard Killer +5
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD) or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD)) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,6223);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_FOOD_MPP, 20)
    target:addMod(MOD_FOOD_MP_CAP, 100)
    target:addMod(MOD_INT, 5)
    target:addMod(MOD_MND, 5)
    target:addMod(MOD_MATT, 13)
    target:addMod(MOD_LIZARD_KILLER, 5)
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_MPP, 20)
    target:delMod(MOD_FOOD_MP_CAP, 100)
    target:delMod(MOD_INT, 5)
    target:delMod(MOD_MND, 5)
    target:delMod(MOD_MATT, 13)
    target:delMod(MOD_LIZARD_KILLER, 5)
end;
