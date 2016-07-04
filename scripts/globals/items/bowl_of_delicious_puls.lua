-----------------------------------------
-- ID: 4533
-- Item: Bowl of Delicious Puls
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Dexterity -1
-- Vitality 3
-- Health Regen While Healing 5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,4533);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, -1);
    target:addMod(MOD_VIT, 3);
    target:addMod(MOD_HPHEAL, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_DEX, -1);
    target:delMod(MOD_VIT, 3);
    target:delMod(MOD_HPHEAL, 5);
end;
