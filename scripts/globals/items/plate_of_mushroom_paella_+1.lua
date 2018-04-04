-----------------------------------------
-- ID: 5971
-- Item: Plate of Mushroom Paella +1
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- HP 43
-- Mind 6
-- Magic Accuracy 6
-- Undead Killer 6
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,5971);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 45);
    target:addMod(MOD_MND, 6);
    target:addMod(MOD_MACC, 6);
    target:addMod(MOD_UNDEAD_KILLER, 6);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 45);
    target:delMod(MOD_MND, 6);
    target:delMod(MOD_MACC, 6);
    target:delMod(MOD_UNDEAD_KILLER, 6);
end;
