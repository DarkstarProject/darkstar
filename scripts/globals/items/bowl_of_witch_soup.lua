-----------------------------------------
-- ID: 4333
-- Item: witch_soup
-- Food Effect: 4hours, All Races
-----------------------------------------
-- Magic Points 25
-- Strength -1
-- Mind 2
-- MP Recovered While Healing 1
-- Enmity -2
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,4333);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MP, 25);
    target:addMod(MOD_STR, -1);
    target:addMod(MOD_MND, 2);
    target:addMod(MOD_MPHEAL, 1);
    target:addMod(MOD_ENMITY, -2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MP, 25);
    target:delMod(MOD_STR, -1);
    target:delMod(MOD_MND, 2);
    target:delMod(MOD_MPHEAL, 1);
    target:delMod(MOD_ENMITY, -2);
end;
