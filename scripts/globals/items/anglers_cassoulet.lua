-----------------------------------------
-- ID: 5704
-- Item: anglers_cassoulet
-- Food Effect: 30, All Races
-----------------------------------------
-- VIT -1
-- AGI +5
-- Ranged Accuracy +1
-- Regen +1
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5704);
end;

----------------------------------------
-- onEffectGain
----------------------------------------
function onEffectGain(target,effect)
    target:addMod(MOD_REGEN, 1);
    target:addMod(MOD_VIT, -1);
    target:addMod(MOD_AGI, 5);
    target:addMod(MOD_RACC, 5);
end

-----------------------------------------
-- onEffectLose Action
-----------------------------------------
function onEffectLose(target,effect)
    target:delMod(MOD_REGEN, 1);
    target:delMod(MOD_VIT, -1);
    target:delMod(MOD_AGI, 5);
    target:delMod(MOD_RACC, 5);
end;
