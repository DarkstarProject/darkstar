-----------------------------------------
-- ID: 5767
-- Item: Crepe Delice
-- Food Effect: 60 Min, All Races
-----------------------------------------
-- HP +15
-- Magic Accuracy +3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5767);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 15);
    target:addMod(MOD_MACC, 3);
    target:addMod(MOD_MDEF, 2);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 15);
    target:delMod(MOD_MACC, 3);
    target:delMod(MOD_MDEF, 2);
end;
