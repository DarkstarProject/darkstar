-----------------------------------------
-- ID: 5975
-- Item: Plate of Flapano's Paella
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- HP 45
-- Vitality 6
-- Defense % 26 Cap 155
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,5975);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 45);
    target:addMod(MOD_VIT, 6);
    target:addMod(MOD_FOOD_DEFP, 26);
    target:addMod(MOD_FOOD_DEF_CAP, 155);
    target:addMod(MOD_UNDEAD_KILLER, 6);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 45);
    target:delMod(MOD_VIT, 6);
    target:delMod(MOD_FOOD_DEFP, 26);
    target:delMod(MOD_FOOD_DEF_CAP, 155);
    target:delMod(MOD_UNDEAD_KILLER, 6);
end;
