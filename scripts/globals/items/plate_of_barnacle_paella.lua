-----------------------------------------
-- ID: 5974
-- Item: Plate of Barnacle Paella
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- HP 40
-- Vitality 5
-- Mind -1
-- Charisma -1
-- Defense % 25 Cap 150
-- Undead Killer 5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5974);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 40);
    target:addMod(MOD_VIT, 5);
    target:addMod(MOD_MND, -1);
    target:addMod(MOD_CHR, -1);
    target:addMod(MOD_FOOD_DEFP, 25);
    target:addMod(MOD_FOOD_DEF_CAP, 150);
    target:addMod(MOD_UNDEAD_KILLER, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 40);
    target:delMod(MOD_VIT, 5);
    target:delMod(MOD_MND, -1);
    target:delMod(MOD_CHR, -1);
    target:delMod(MOD_FOOD_DEFP, 25);
    target:delMod(MOD_FOOD_DEF_CAP, 150);
    target:delMod(MOD_UNDEAD_KILLER, 5);
end;
