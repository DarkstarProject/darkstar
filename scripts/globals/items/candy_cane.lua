-----------------------------------------
-- ID: 5622
-- Item: Candy Cane
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- Intelligence 4
-- Mind 4
-- MP Recovery while healing 2
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5622);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_INT, 4);
    target:addMod(MOD_MND, 4);
    target:addMod(MOD_MPHEAL, 2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_INT, 4);
    target:delMod(MOD_MND, 4);
    target:delMod(MOD_MPHEAL, 2);
end;
