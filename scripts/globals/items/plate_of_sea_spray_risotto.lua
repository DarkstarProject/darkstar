-----------------------------------------
-- ID: 4268
-- Item: plate_of_sea_spray_risotto
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- HP 45
-- Dexterity 6
-- Agility 3
-- Mind -4
-- HP Recovered While Healing 1
-- Accuracy % 6 (cap 20)
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,4268);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 45);
    target:addMod(MOD_DEX, 6);
    target:addMod(MOD_AGI, 3);
    target:addMod(MOD_MND, -4);
    target:addMod(MOD_HPHEAL, 1);
    target:addMod(MOD_FOOD_ACCP, 6);
    target:addMod(MOD_FOOD_ACC_CAP, 20);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 45);
    target:delMod(MOD_DEX, 6);
    target:delMod(MOD_AGI, 3);
    target:delMod(MOD_MND, -4);
    target:delMod(MOD_HPHEAL, 1);
    target:delMod(MOD_FOOD_ACCP, 6);
    target:delMod(MOD_FOOD_ACC_CAP, 20);
end;
