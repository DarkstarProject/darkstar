-----------------------------------------
-- ID: 5778
-- Item: Crepe Belle Helene
-- Food Effect: 60 Min, All Races
-----------------------------------------
-- Intelligence +2
-- MP Healing +3
-- Magic Accuracy +6
-- Magic Defense +1
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5778);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_INT, 2);
    target:addMod(MOD_MPHEAL, 3);
    target:addMod(MOD_MACC, 6);
    target:addMod(MOD_MDEF, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_INT, 2);
    target:delMod(MOD_MPHEAL, 3);
    target:delMod(MOD_MACC, 6);
    target:delMod(MOD_MDEF, 1);
end;
