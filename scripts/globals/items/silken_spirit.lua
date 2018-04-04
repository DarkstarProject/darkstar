-----------------------------------------
-- ID: 5634
-- Item: Silken Spirit
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- MP +4% (cap 90)
-- HP Recovered while healing +2
-- MP Recovered while healing +7
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,5634);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_FOOD_MPP, 4);
    target:addMod(MOD_FOOD_MP_CAP, 90);
    target:addMod(MOD_HPHEAL, 2);
    target:addMod(MOD_MPHEAL, 7);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_MPP, 4);
    target:delMod(MOD_FOOD_MP_CAP, 90);
    target:delMod(MOD_HPHEAL, 2);
    target:delMod(MOD_MPHEAL, 7);
end;
