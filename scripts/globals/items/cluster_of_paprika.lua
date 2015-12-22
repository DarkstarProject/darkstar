-----------------------------------------
-- ID: 5740
-- Item: Cluster of Paprika
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Agility 1
-- Vitality -3
-- Defense -1
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,300,5740);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_VIT, -3);
    target:addMod(MOD_DEF, -1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_VIT, -3);
    target:delMod(MOD_DEF, -1);
end;
