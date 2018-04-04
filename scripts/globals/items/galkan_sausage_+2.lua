-----------------------------------------
-- ID: 5860
-- Item: galkan_sausage_+2
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Strength 5
-- Intelligence -6
-- Attack 11
-- Ranged Attack 11
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5860);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_STR, 5);
    target:addMod(MOD_INT, -6);
    target:addMod(MOD_ATT, 11);
    target:addMod(MOD_RATT, 11);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, 5);
    target:delMod(MOD_INT, -6);
    target:delMod(MOD_ATT, 11);
    target:delMod(MOD_RATT, 11);
end;
