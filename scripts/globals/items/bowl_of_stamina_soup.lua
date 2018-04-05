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

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,4337);
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

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_HPP, 12);
    target:delMod(MOD_FOOD_HP_CAP, 200);
    target:delMod(MOD_DEX, 4);
    target:delMod(MOD_VIT, 6);
    target:delMod(MOD_MND, -3);
    target:delMod(MOD_HPHEAL, 10);
end;
