-----------------------------------------
-- ID: 4400
-- Item: slice_of_land_crab_meat
-- Food Effect: 5Min, Mithra only
-----------------------------------------
-- Dexterity -4
-- Vitality 3
-- Defense % 14
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
local result = 0;
    if (target:getRace() ~= 7) then
        result = 247;
    end
    if (target:getMod(MOD_EAT_RAW_FISH) == 1) then
        result = 0;
    end
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,300,4400);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, -4);
    target:addMod(MOD_VIT, 3);
    target:addMod(MOD_DEFP, 14);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_DEX, -4);
    target:delMod(MOD_VIT, 3);
    target:delMod(MOD_DEFP, 14);
end;
