-----------------------------------------
-- ID: 4495
-- Item: chunk_of_goblin_chocolate
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Charisma -5
-- Health Regen While Healing 5
-- Lizard Killer 5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,180,4495);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_CHR, -5);
    target:addMod(MOD_HPHEAL, 5);
    target:addMod(MOD_LIZARD_KILLER, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_CHR, -5);
    target:delMod(MOD_HPHEAL, 5);
    target:delMod(MOD_LIZARD_KILLER, 5);
end;
