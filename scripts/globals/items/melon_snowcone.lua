-----------------------------------------
-- ID: 5712
-- Item: Melon Snowcone
-- Food Effect: 5 Min, All Races
-----------------------------------------
-- HP % 10 Cap 200
-- HP Healing 3
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD)) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,5712);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 10);
    target:addMod(MOD_FOOD_HP_CAP, 200);
    target:addMod(MOD_HPHEAL, 3);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_HPP, 10);
    target:delMod(MOD_FOOD_HP_CAP, 200);
    target:delMod(MOD_HPHEAL, 3);
end;
