-----------------------------------------
-- ID: 5217
-- Item: serving_of_salmon_eggs
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Health 6
-- Magic 6
-- Dexterity 2
-- Mind -3
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,5217);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 6);
    target:addMod(MOD_MP, 6);
    target:addMod(MOD_DEX, 2);
    target:addMod(MOD_MND, -3);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 6);
    target:delMod(MOD_MP, 6);
    target:delMod(MOD_DEX, 2);
    target:delMod(MOD_MND, -3);
end;
