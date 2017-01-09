-----------------------------------------
-- ID: 4337
-- Item: bowl_of_stamina_soup
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- HP +12% (cap 200)
-- Dexterity 4
-- Vitality 6
-- Mind -3
-- HP Recovered While Healing 10
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,4337);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 12);
    target:addMod(MOD_FOOD_HP_CAP, 200);
    target:addMod(MOD_DEX, 4);
    target:addMod(MOD_VIT, 6);
    target:addMod(MOD_MND, -3);
    target:addMod(MOD_HPHEAL, 10);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 12);
    target:delMod(MOD_FOOD_HP_CAP, 200);
    target:delMod(MOD_DEX, 4);
    target:delMod(MOD_VIT, 6);
    target:delMod(MOD_MND, -3);
    target:delMod(MOD_HPHEAL, 10);
end;
