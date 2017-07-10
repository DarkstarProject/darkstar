-----------------------------------------
-- ID: 6272
-- Item: fried_popoto
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +30
-- VIT +2
-- Fire resistance +20
-- DEF +20% (cap 145)
-- Subtle Blow +8
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,6272);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 30);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_FIRERES, 20);
    target:addMod(MOD_FOOD_DEFP, 20);
    target:addMod(MOD_FOOD_DEF_CAP, 145);
    target:addMod(MOD_SUBTLE_BLOW, 8);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 30);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_FIRERES, 20);
    target:delMod(MOD_FOOD_DEFP, 20);
    target:delMod(MOD_FOOD_DEF_CAP, 145);
    target:delMod(MOD_SUBTLE_BLOW, 8);
end;
