-----------------------------------------
-- ID: 5920
-- Item: Fudgy-wudge
-- Food Effect: 3 Min, All Races
-----------------------------------------
-- Intelligence 1
-- Speed 12.5%
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT.FOOD) == true or target:hasStatusEffect(EFFECT.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT.FOOD,0,0,180,5920);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_INT, 1);
    target:addMod(MOD_MOVE, 13);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_INT, 1);
    target:delMod(MOD_MOVE, 13);
end;
