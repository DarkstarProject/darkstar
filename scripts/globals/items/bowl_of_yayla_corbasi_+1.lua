-----------------------------------------
-- ID: 5580
-- Item: bowl_of_yayla_corbasi_+1
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- HP 25
-- Dexterity -1
-- Vitality 3
-- HP Recovered While Healing 5
-- MP Recovered While Healing 2
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5580);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 25);
    target:addMod(MOD_DEX, -1);
    target:addMod(MOD_VIT, 3);
    target:addMod(MOD_HPHEAL, 5);
    target:addMod(MOD_MPHEAL, 2);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 25);
    target:delMod(MOD_DEX, -1);
    target:delMod(MOD_VIT, 3);
    target:delMod(MOD_HPHEAL, 5);
    target:delMod(MOD_MPHEAL, 2);
end;
