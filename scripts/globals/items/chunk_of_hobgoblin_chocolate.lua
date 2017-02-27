-----------------------------------------
-- ID: 4324
-- Item: chunk_of_hobgoblin_chocolate
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Health Regen While Healing 7
-- Lizard Killer 12
-- Petrify Resist 12
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
    target:addStatusEffect(EFFECT_FOOD,0,0,300,4324);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HPHEAL, 7);
    target:addMod(MOD_LIZARD_KILLER, 12);
    target:addMod(MOD_PETRIFYRES, 12);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HPHEAL, 7);
    target:delMod(MOD_LIZARD_KILLER, 12);
    target:delMod(MOD_PETRIFYRES, 12);
end;
