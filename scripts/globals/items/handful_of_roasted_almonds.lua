-----------------------------------------
-- ID: 5649
-- Item: Handful of Roasted Almonds
-- Food Effect: 5Min, All Races
-----------------------------------------
-- HP 30
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,5649);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 30);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 30);
end;
