-----------------------------------------
-- ID: 5977
-- Item: Bowl of Ulbuconut Milk +1
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Charisma +4
-- Vitality -1
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,180,5977);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_CHR, 4);
    target:addMod(MOD_VIT, -1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_CHR, 4);
    target:delMod(MOD_VIT, -1);
end;
