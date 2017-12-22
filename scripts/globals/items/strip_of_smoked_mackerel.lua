-----------------------------------------
-- ID: 5943
-- Item: Strip of Smoked Mackerel
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Agility 4
-- Vitality -3
-- Evasion +5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5943);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_AGI, 4);
    target:addMod(MOD_VIT, -3);
    target:addMod(MOD_EVA, 5);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_AGI, 4);
    target:delMod(MOD_VIT, -3);
    target:delMod(MOD_EVA, 5);
end;
