-----------------------------------------
-- ID: 4443
-- Item: cobalt_jellyfish
-- Food Effect: 5 Min, Mithra only
-----------------------------------------
-- Dexterity 1
-- Mind -3
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
    target:addStatusEffect(EFFECT.FOOD,0,0,300,4443);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 1);
    target:addMod(MOD_MND,-3);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, 1);
    target:delMod(MOD_MND,-3);
end;
