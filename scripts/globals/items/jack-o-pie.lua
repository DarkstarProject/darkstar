-----------------------------------------
-- ID: 5644
-- Item: jack-o-pie
-- Food Effect: 1hour, All Races
-----------------------------------------
-- MP 45
-- CHR -1
-- Intelligence 4
-- hMP +1
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5644);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MP, 45);
    target:addMod(MOD_CHR, -1);
    target:addMod(MOD_INT, 4);
    target:addMod(MOD_MPHEAL, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_MP, 45);
    target:delMod(MOD_CHR, -1);
    target:delMod(MOD_INT, 4);
    target:delMod(MOD_MPHEAL, 1);
end;
