-----------------------------------------
-- ID: 5861
-- Item: galkan_sausage_+3
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Strength 6
-- Intelligence -7
-- Attack 12
-- Ranged Attack 12
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5861);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_STR, 6);
    target:addMod(MOD_INT, -7);
    target:addMod(MOD_ATT, 12);
    target:addMod(MOD_RATT, 12);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, 6);
    target:delMod(MOD_INT, -7);
    target:delMod(MOD_ATT, 12);
    target:delMod(MOD_RATT, 12);
end;
