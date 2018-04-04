-----------------------------------------
-- ID: 4467
-- Item: garlic_cracker
-- Food Effect: 3Min, All Races
-----------------------------------------
-- HP Regen While Healing 6
-- Undead Killer 10
-- Blind Resist 10
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,180,4467);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HPHEAL, 6);
    target:addMod(MOD_UNDEAD_KILLER, 10);
    target:addMod(MOD_BLINDRES, 10);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HPHEAL, 6);
    target:delMod(MOD_UNDEAD_KILLER, 10);
    target:delMod(MOD_BLINDRES, 10);
end;
