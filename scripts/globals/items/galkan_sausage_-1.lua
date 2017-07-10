-----------------------------------------
-- ID: 5862
-- Item: galkan_sausage_-1
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Strength -3
-- Dexterity -3
-- Vitality -3
-- Agility -3
-- Mind -3
-- Intelligence -3
-- Charisma -3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5862);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR, -3);
    target:addMod(MOD_DEX, -3);
    target:addMod(MOD_VIT, -3);
    target:addMod(MOD_AGI, -3);
    target:addMod(MOD_MND, -3);
    target:addMod(MOD_INT, -3);
    target:addMod(MOD_CHR, -3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_STR, -3);
    target:delMod(MOD_DEX, -3);
    target:delMod(MOD_VIT, -3);
    target:delMod(MOD_AGI, -3);
    target:delMod(MOD_MND, -3);
    target:delMod(MOD_INT, -3);
    target:delMod(MOD_CHR, -3);
end;
