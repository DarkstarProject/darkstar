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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5971);
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

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 45);
    target:delMod(MOD_MND, 6);
    target:delMod(MOD_MACC, 6);
    target:delMod(MOD_UNDEAD_KILLER, 6);
end;
