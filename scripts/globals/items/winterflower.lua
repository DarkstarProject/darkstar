-----------------------------------------
-- ID: 5907
-- Item: Winterflower
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Agility +3
-- Intelligence +5
-- Charisma -5
-- Resist Virus +20
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
    target:addStatusEffect(EFFECT_FOOD,0,0,300,5907);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_AGI, 3);
    target:addMod(MOD_INT, 5);
    target:addMod(MOD_CHR, -5);
    target:addMod(MOD_VIRUSRES, 20);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_AGI, 3);
    target:delMod(MOD_INT, 5);
    target:delMod(MOD_CHR, -5);
    target:delMod(MOD_VIRUSRES, 20);
end;
