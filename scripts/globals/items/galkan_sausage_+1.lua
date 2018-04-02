-----------------------------------------
-- ID: 5859
-- Item: galkan_sausage_+1
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Strength 4
-- Intelligence -5
-- Attack 10
-- Ranged Attack 10
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5859);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_STR, 4);
    target:addMod(MOD_INT, -5);
    target:addMod(MOD_ATT, 10);
    target:addMod(MOD_RATT, 10);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, 4);
    target:delMod(MOD_INT, -5);
    target:delMod(MOD_ATT, 10);
    target:delMod(MOD_RATT, 10);
end;
