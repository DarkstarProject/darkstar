-----------------------------------------
-- ID: 4282
-- Item: pipin_hot_popoto
-- Food Effect: 60Min, All Races
-----------------------------------------
-- HP 25
-- Vitality 3
-- HP recovered while healing 1
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,4282);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 25);
    target:addMod(MOD_VIT, 3);
    target:addMod(MOD_HPHEAL, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 25);
    target:delMod(MOD_VIT, 3);
    target:delMod(MOD_HPHEAL, 1);
end;
