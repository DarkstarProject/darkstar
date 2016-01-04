-----------------------------------------
-- ID: 5677
-- Item: Serving of Patriarch Sautee
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- MP 60
-- Mind 7
-- MP Recovered While Healing 7
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5677);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MP, 60);
    target:addMod(MOD_MND, 7);
    target:addMod(MOD_MPHEAL, 7);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_MP, 60);
    target:delMod(MOD_MND, 7);
    target:delMod(MOD_MPHEAL, 7);
end;
