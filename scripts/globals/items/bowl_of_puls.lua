-----------------------------------------
-- ID: 4492
-- Item: bowl_of_puls
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- Vitality 2
-- Dexterity -1
-- HP Recovered While Healing 3
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,4492);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_DEX, -1);
    target:addMod(MOD_HPHEAL, 3);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_DEX, -1);
    target:delMod(MOD_HPHEAL, 3);
end;
