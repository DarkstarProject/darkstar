-----------------------------------------
-- ID: 5632
-- Item: Silken Sash
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP Recovered while healing +3
-- MP Recovered while healing +6
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5632);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HPHEAL, 3);
    target:addMod(MOD_MPHEAL, 6);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HPHEAL, 3);
    target:delMod(MOD_MPHEAL, 6);
end;
