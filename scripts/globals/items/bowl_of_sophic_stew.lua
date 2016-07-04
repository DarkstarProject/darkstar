-----------------------------------------
-- ID: 5180
-- Item: bowl_of_sophic_stew
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- Dexterity 6
-- Intelligence 6
-- Mind 6
-- HP Recovered While Healing 3
-- MP Recovered While Healing 3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5180);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 6);
    target:addMod(MOD_INT, 6);
    target:addMod(MOD_MND, 6);
    target:addMod(MOD_HPHEAL, 3);
    target:addMod(MOD_MPHEAL, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_DEX, 6);
    target:delMod(MOD_INT, 6);
    target:delMod(MOD_MND, 6);
    target:delMod(MOD_HPHEAL, 3);
    target:delMod(MOD_MPHEAL, 3);
end;
