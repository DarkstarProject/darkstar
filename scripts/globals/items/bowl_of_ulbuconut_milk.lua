-----------------------------------------
-- ID: 5976
-- Item: Bowl of Ulbuconut Milk
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Charisma +3
-- Vitality -2
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT.FOOD) == true or target:hasStatusEffect(EFFECT.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT.FOOD,0,0,180,5976);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_CHR, 3);
    target:addMod(MOD_VIT, -2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_CHR, 3);
    target:delMod(MOD_VIT, -2);
end;
