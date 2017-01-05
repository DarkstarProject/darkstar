-----------------------------------------
-- ID: 5745
-- Item: serving_of_cherry_bavarois
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- HP 25
-- Intelligence 3
-- MP 10
-- HP Recovered While Healing 3
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5745);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 25);
    target:addMod(MOD_INT, 3);
    target:addMod(MOD_MP, 10);
    target:addMod(MOD_HPHEAL, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 25);
    target:delMod(MOD_INT, 3);
    target:delMod(MOD_MP, 10);
    target:delMod(MOD_HPHEAL, 3);
end;
