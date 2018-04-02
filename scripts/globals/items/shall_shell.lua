-----------------------------------------
-- ID: 4484
-- Item: shall_shell
-- Food Effect: 5Min, Mithra only
-----------------------------------------
-- Dexterity -5
-- Vitality 4
-- Defense % 16.4
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getRace() ~= 7) then
        result = 247;
    elseif (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,4484);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_DEX, -5);
    target:addMod(MOD_VIT, 4);
    target:addMod(MOD_FOOD_DEFP, 16.4);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, -5);
    target:delMod(MOD_VIT, 4);
    target:delMod(MOD_FOOD_DEFP, 16.4);
end;
