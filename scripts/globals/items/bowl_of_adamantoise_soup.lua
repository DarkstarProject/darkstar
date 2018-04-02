-----------------------------------------
-- ID: 5210
-- Item: Bowl of Adamantoise Soup
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Strength -7
-- Dexterity -7
-- Agility -7
-- Vitality -7
-- Intelligence -7
-- Mind -7
-- Charisma -7
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,5210);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR, -7);
    target:addMod(MOD_DEX, -7);
    target:addMod(MOD_AGI, -7);
    target:addMod(MOD_VIT, -7);
    target:addMod(MOD_INT, -7);
    target:addMod(MOD_MND, -7);
    target:addMod(MOD_CHR, -7);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, -7);
    target:delMod(MOD_DEX, -7);
    target:delMod(MOD_AGI, -7);
    target:delMod(MOD_VIT, -7);
    target:delMod(MOD_INT, -7);
    target:delMod(MOD_MND, -7);
    target:delMod(MOD_CHR, -7);
end;
