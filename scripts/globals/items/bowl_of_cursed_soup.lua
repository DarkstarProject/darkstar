-----------------------------------------
-- ID: 4235
-- Item: Bowl of Cursed Soup
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,4235);
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

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_STR, -7);
    target:delMod(MOD_DEX, -7);
    target:delMod(MOD_AGI, -7);
    target:delMod(MOD_VIT, -7);
    target:delMod(MOD_INT, -7);
    target:delMod(MOD_MND, -7);
    target:delMod(MOD_CHR, -7);
end;
