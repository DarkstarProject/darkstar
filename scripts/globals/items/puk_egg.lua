-----------------------------------------
-- ID: 5569
-- Item: puk_egg
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Health 6
-- Magic 6
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
    target:addStatusEffect(EFFECT_FOOD,0,0,300,5569);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 6);
    target:addMod(MOD_MP, 6);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 6);
    target:delMod(MOD_MP, 6);
end;
