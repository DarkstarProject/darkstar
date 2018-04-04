-----------------------------------------
-- ID: 5587
-- Item: serving_of_menemen_+1
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- HP 35
-- MP 35
-- Agility 2
-- Intelligence -2
-- HP recovered while healing 2
-- MP recovered while healing 2
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,5587);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 35);
    target:addMod(MOD_MP, 35);
    target:addMod(MOD_AGI, 2);
    target:addMod(MOD_INT, -2);
    target:addMod(MOD_HPHEAL, 2);
    target:addMod(MOD_MPHEAL, 2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 35);
    target:delMod(MOD_MP, 35);
    target:delMod(MOD_AGI, 2);
    target:delMod(MOD_INT, -2);
    target:delMod(MOD_HPHEAL, 2);
    target:delMod(MOD_MPHEAL, 2);
end;
