-----------------------------------------
-- ID: 5919
-- Item: Choco-ligar
-- Food Effect: 3 Min, All Races
-----------------------------------------
-- Vitality 1
-- Speed 12.5%
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
    target:addStatusEffect(EFFECT_FOOD,0,0,180,5919);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_VIT, 1);
    target:addMod(MOD_MOVE, 13);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_VIT, 1);
    target:delMod(MOD_MOVE, 13);
end;
