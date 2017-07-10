-----------------------------------------
-- ID: 5908
-- Item: Butterpear
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Agility +4
-- Vitality +1
-- Resist Amnesia +20
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
    target:addStatusEffect(EFFECT_FOOD,0,0,300,5908);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_AGI, 4);
    target:addMod(MOD_VIT, 1);
    target:addMod(MOD_AMNESIARES, 20);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_AGI, 4);
    target:delMod(MOD_VIT, 1);
    target:delMod(MOD_AMNESIARES, 20);
end;
