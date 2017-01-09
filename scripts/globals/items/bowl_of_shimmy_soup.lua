-----------------------------------------
-- ID: 5931
-- Item: Bowl of Shimmy Soup
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- MP 32
-- Mind 5
-- HP Recovered While Healing 5
-- Enmity -5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5931);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MP, 32);
    target:addMod(MOD_MND, 5);
    target:addMod(MOD_HPHEAL, 5);
    target:addMod(MOD_ENMITY, -5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_MP, 32);
    target:delMod(MOD_MND, 5);
    target:delMod(MOD_HPHEAL, 5);
    target:delMod(MOD_ENMITY, -5);
end;
