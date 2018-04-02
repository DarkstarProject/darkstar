-----------------------------------------
-- ID: 4330
-- Item: witch_risotto
-- Food Effect: 4hours, All Races
-----------------------------------------
-- Magic Points 35
-- Strength -1
-- Vitality 3
-- Mind 3
-- MP Recovered While Healing 2
-- Enmity -4
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,4330);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MP, 35);
    target:addMod(MOD_STR, -1);
    target:addMod(MOD_VIT, 3);
    target:addMod(MOD_MND, 3);
    target:addMod(MOD_MPHEAL, 2);
    target:addMod(MOD_ENMITY, -4);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MP, 35);
    target:delMod(MOD_STR, -1);
    target:delMod(MOD_VIT, 3);
    target:delMod(MOD_MND, 3);
    target:delMod(MOD_MPHEAL, 2);
    target:delMod(MOD_ENMITY, -4);
end;
