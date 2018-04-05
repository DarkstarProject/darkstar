-----------------------------------------
-- ID: 5701
-- Item: nopales_salad
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- Strength 1
-- Agility 6
-- Ranged Accuracy +20
-- Ranged Attack +10
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,5701);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_STR, 1);
    target:addMod(MOD_AGI, 6);
    target:addMod(MOD_RACC, 20);
    target:addMod(MOD_RATT, 10);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, 1);
    target:delMod(MOD_AGI, 6);
    target:delMod(MOD_RACC, 20);
    target:delMod(MOD_RATT, 10);
end;
