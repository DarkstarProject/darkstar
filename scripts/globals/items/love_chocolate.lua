-----------------------------------------
-- ID: 5230
-- Item: love_chocolate
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Magic Regen While Healing 4
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5230);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_MPHEAL, 4);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MPHEAL, 4);
end;
