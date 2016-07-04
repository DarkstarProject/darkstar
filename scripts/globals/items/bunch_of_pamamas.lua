-----------------------------------------
-- ID: 4468
-- Item: Bunch of Pamamas
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Strength -3
-- Intelligence 1
-- Additional Effect with Opo-Opo Crown
-- HP 50
-- MP 50
-- CHR 14
-- Additional Effect with Kinkobo or 
-- Primate Staff
-- DELAY -90
-- ACC 10
-- Additional Effect with Primate Staff +1
-- DELAY -80
-- ACC 12
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,4468);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR, -3);
    target:addMod(MOD_INT, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_STR, -3);
    target:delMod(MOD_INT, 1);
end;
