-----------------------------------------
-- ID: 6010
-- Item: Sakura Biscuit
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Intelligence 3
-- Charisma 2
-- Evasion +2
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
    target:addStatusEffect(EFFECT.FOOD,0,0,1800,6010);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_INT, 3);
    target:addMod(MOD_CHR, 2);
    target:addMod(MOD_EVA, 2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_INT, 3);
    target:delMod(MOD_CHR, 2);
    target:delMod(MOD_EVA, 2);
end;
