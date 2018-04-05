-----------------------------------------
-- ID: 5676
-- Item: serving_of_mushroom_sautee
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- MP 60
-- Mind 6
-- MP Recovered While Healing 6
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,5676);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MP, 60);
    target:addMod(MOD_MND, 6);
    target:addMod(MOD_MPHEAL, 6);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MP, 60);
    target:delMod(MOD_MND, 6);
    target:delMod(MOD_MPHEAL, 6);
end;
