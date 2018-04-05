-----------------------------------------
-- ID: 4270
-- Item: sweet_rice_cake
-- Food Effect: 30Min, All Races
-----------------------------------------
-- MP 17
-- Vitality 2
-- Intelligence 3
-- Mind 1
-- HP Recovered While Healing 2
-- MP Recovered While Healing 2
-- Evasion 5
-- Resist Silence 4
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,4270);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MP, 17);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_INT, 3);
    target:addMod(MOD_MND, 1);
    target:addMod(MOD_HPHEAL, 2);
    target:addMod(MOD_MPHEAL, 2);
    target:addMod(MOD_EVA, 5);
    target:addMod(MOD_SILENCERES, 4);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MP, 17);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_INT, 3);
    target:delMod(MOD_MND, 1);
    target:delMod(MOD_HPHEAL, 2);
    target:delMod(MOD_MPHEAL, 2);
    target:delMod(MOD_EVA, 5);
    target:delMod(MOD_SILENCERES, 4);
end;
