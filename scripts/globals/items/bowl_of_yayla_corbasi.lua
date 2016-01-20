-----------------------------------------
-- ID: 5579
-- Item: bowl_of_yayla_corbasi
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- HP 20
-- Dexterity -1
-- Vitality 2
-- HP Recovered While Healing 3
-- MP Recovered While Healing 1
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5579);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 20);
    target:addMod(MOD_DEX, -1);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_HPHEAL, 3);
    target:addMod(MOD_MPHEAL, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 20);
    target:delMod(MOD_DEX, -1);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_HPHEAL, 3);
    target:delMod(MOD_MPHEAL, 1);
end;
