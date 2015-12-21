-----------------------------------------
-- ID: 5776
-- Item: Crepe Caprice
-- Food Effect: 60 Min, All Races
-----------------------------------------
-- HP +20
-- MP Healing 3
-- Magic Accuracy +5
-- Magic Defense +2
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5776);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 20);
    target:addMod(MOD_MPHEAL, 3);
    target:addMod(MOD_MACC, 5);
    target:addMod(MOD_MDEF, 2);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 20);
    target:delMod(MOD_MPHEAL, 3);
    target:delMod(MOD_MACC, 5);
    target:delMod(MOD_MDEF, 2);
end;
