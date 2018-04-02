-----------------------------------------
-- ID: 4495
-- Item: chunk_of_goblin_chocolate
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Health Regen While Healing 5
-- Lizard Killer 10
-- Petrify resistance +10
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,180,4495);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HPHEAL, 5);
    target:addMod(MOD_LIZARD_KILLER, 5);
    target:addMod(MOD_PETRIFYRES, 5);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HPHEAL, 5);
    target:delMod(MOD_LIZARD_KILLER, 5);
    target:delMod(MOD_PETRIFYRES, 5);
end;
