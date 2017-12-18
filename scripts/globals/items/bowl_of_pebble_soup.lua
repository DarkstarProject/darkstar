-----------------------------------------
-- ID: 4455
-- Item: Bowl of Pebble Soup
-- Food Effect: 3 Hr, All Races
-----------------------------------------
-- HP Recovered while healing 2
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,4455);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HPHEAL, 2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HPHEAL, 2);
end;
