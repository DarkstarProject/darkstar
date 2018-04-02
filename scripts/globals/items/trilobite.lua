-----------------------------------------
-- ID: 4317
-- Item: Trilobite
-- Food Effect: 5Min, Mithra only
-----------------------------------------
-- Dexterity -5
-- Vitality 3
-- Defense +16%
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getRace() ~= 7) then
        result = 247;
    end
    if (target:getMod(MOD_EAT_RAW_FISH) == 1) then
        result = 0;
    end
    if (target:hasStatusEffect(EFFECT.FOOD) == true or target:hasStatusEffect(EFFECT.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT.FOOD,0,0,300,4317);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_DEX, -5);
    target:addMod(MOD_VIT, 3);
    target:addMod(MOD_DEFP, 16);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, -5);
    target:delMod(MOD_VIT, 3);
    target:delMod(MOD_DEFP, 16);
end;
