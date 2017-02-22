-----------------------------------------
-- ID: 4510
-- Item: Acorn Cookie
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Aquan killer +10
-- Silence resistance +10
-- MP recovered while healing +3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,180,4510);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_AQUAN_KILLER, 10);
    target:addMod(MOD_SILENCERES, 10);
    target:addMod(MOD_MPHEAL, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_AQUAN_KILLER, 10);
    target:delMod(MOD_SILENCERES, 10);
    target:delMod(MOD_MPHEAL, 3);
end;
