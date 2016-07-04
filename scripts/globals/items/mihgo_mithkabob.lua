-----------------------------------------
-- ID: 5708
-- Item: Mihgo Mithkabob
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- Dexterity 5
-- Vitality 2
-- Mind -2
-- Defense % 25
-- Defense Cap 65
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5708);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 5);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_MND, -2);
    target:addMod(MOD_FOOD_DEFP, 25);
    target:addMod(MOD_FOOD_DEF_CAP, 60);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_DEX, 5);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_MND, -2);
    target:delMod(MOD_FOOD_DEFP, 25);
    target:delMod(MOD_FOOD_DEF_CAP, 60);
end;
