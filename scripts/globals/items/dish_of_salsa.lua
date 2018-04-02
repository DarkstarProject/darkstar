-----------------------------------------
-- ID: 5299
-- Item: dish_of_salsa
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Strength -1
-- Dexterity -1
-- Agility -1
-- Vitality -1
-- Intelligence -1
-- Mind -1
-- Sleep Resist 5
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,180,5299);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_STR, -1);
    target:addMod(MOD_DEX, -1);
    target:addMod(MOD_AGI, -1);
    target:addMod(MOD_VIT, -1);
    target:addMod(MOD_INT, -1);
    target:addMod(MOD_MND, -1);
    target:addMod(MOD_SLEEPRES, 5);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, -1);
    target:delMod(MOD_DEX, -1);
    target:delMod(MOD_AGI, -1);
    target:delMod(MOD_VIT, -1);
    target:delMod(MOD_INT, -1);
    target:delMod(MOD_MND, -1);
    target:delMod(MOD_SLEEPRES, 5);
end;
