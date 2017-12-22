-----------------------------------------
-- ID: 5626
-- Item: Silken Siesta
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP Recoverd while healing 2
-- MP Recovered while healing 5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5626);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HPHEAL, 2);
    target:addMod(MOD_MPHEAL, 5);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HPHEAL, 2);
    target:delMod(MOD_MPHEAL, 5);
end;
