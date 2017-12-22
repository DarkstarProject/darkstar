-----------------------------------------
-- ID: 5960
-- Item: Ulbukan Lobster
-- Food Effect: 5 Min, Mithra only
-----------------------------------------
-- Dexterity -3
-- Vitality 1
-- Defense +9%
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
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,300,5960);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_DEX, -3);
    target:addMod(MOD_VIT, 1);
    target:addMod(MOD_DEFP, 9);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, -3);
    target:delMod(MOD_VIT, 1);
    target:delMod(MOD_DEFP, 9);
end;
