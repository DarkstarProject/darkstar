-----------------------------------------
-- ID: 4568
-- Item: moon_ball
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 3
-- Magic 3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,4568);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 3);
    target:addMod(MOD_MP, 3);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 3);
    target:delMod(MOD_MP, 3);
end;
