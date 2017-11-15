-----------------------------------------
-- ID: 4415
-- Item: ear_of_roasted_corn
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 6
-- Dexterity -1
-- Vitality 3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,4415);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 6);
    target:addMod(MOD_DEX, -1);
    target:addMod(MOD_VIT, 3);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 6);
    target:delMod(MOD_DEX, -1);
    target:delMod(MOD_VIT, 3);
end;
