-----------------------------------------
-- ID: 5628
-- Item: Silken Smile
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- Intelligence 2
-- HP Recovered while healing 4
-- MP Recovered while healing 7
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,5628);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_INT, 2);
    target:addMod(MOD_HPHEAL, 4);
    target:addMod(MOD_MPHEAL, 7);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_INT, 2);
    target:delMod(MOD_HPHEAL, 4);
    target:delMod(MOD_MPHEAL, 7);
end;
