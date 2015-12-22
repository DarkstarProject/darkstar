-----------------------------------------
-- ID: 5641
-- Item: M&P Dumpling
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Intelligence 5
-- Agility -5
-- MP 30
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,180,5641);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MP, 30);
    target:addMod(MOD_INT, 5);
    target:addMod(MOD_AGI, -5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_MP, 30);
    target:delMod(MOD_INT, 5);
    target:delMod(MOD_AGI, -5);
end;
