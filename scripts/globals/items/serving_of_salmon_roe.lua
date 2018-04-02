-----------------------------------------
-- ID: 5218
-- Item: serving_of_salmon_roe
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 8
-- Magic 8
-- Dexterity 2
-- Mind -1
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5218);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 8);
    target:addMod(MOD_MP, 8);
    target:addMod(MOD_DEX, 2);
    target:addMod(MOD_MND, -1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 8);
    target:delMod(MOD_MP, 8);
    target:delMod(MOD_DEX, 2);
    target:delMod(MOD_MND, -1);
end;
