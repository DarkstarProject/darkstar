-----------------------------------------
-- ID: 5574
-- Item: dried_date_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health 12
-- Magic 22
-- Agility -1
-- Intelligence 4
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,5574);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 12);
    target:addMod(MOD_MP, 22);
    target:addMod(MOD_AGI, -1);
    target:addMod(MOD_INT, 4);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 12);
    target:delMod(MOD_MP, 22);
    target:delMod(MOD_AGI, -1);
    target:delMod(MOD_INT, 4);
end;
