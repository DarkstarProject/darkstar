-----------------------------------------
-- ID: 5677
-- Item: Serving of Patriarch Sautee
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- MP 65
-- Mind 7
-- MP Recovered While Healing 7
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,5677);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MP, 65);
    target:addMod(MOD_MND, 7);
    target:addMod(MOD_MPHEAL, 7);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MP, 65);
    target:delMod(MOD_MND, 7);
    target:delMod(MOD_MPHEAL, 7);
end;
