-----------------------------------------
-- ID: 4581
-- Item: Blackened Newt
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Dexterity 4
-- Mind -3
-- Attack % 18
-- Attack Cap 60
-- Virus Resist 4
-- Curse Resist 4
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,4581);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 4);
    target:addMod(MOD_MND, -3);
    target:addMod(MOD_FOOD_ATTP, 18);
    target:addMod(MOD_FOOD_ATT_CAP, 60);
    target:addMod(MOD_VIRUSRES, 4);
    target:addMod(MOD_CURSERES, 4);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, 4);
    target:delMod(MOD_MND, -3);
    target:delMod(MOD_FOOD_ATTP, 18);
    target:delMod(MOD_FOOD_ATT_CAP, 60);
    target:delMod(MOD_VIRUSRES, 4);
    target:delMod(MOD_CURSERES, 4);
end;
