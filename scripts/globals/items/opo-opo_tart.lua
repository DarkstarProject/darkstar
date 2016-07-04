-----------------------------------------
-- ID: 4287
-- Item: opo-opo_tart
-- Food Effect: 1hour, All Races
-----------------------------------------
-- HP 12
-- MP 12
-- Intelligence 4
-- MP Recovered While Healing 3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,4287);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 12);
    target:addMod(MOD_MP, 12);
    target:addMod(MOD_INT, 4);
    target:addMod(MOD_MPHEAL, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 12);
    target:delMod(MOD_MP, 12);
    target:delMod(MOD_INT, 4);
    target:delMod(MOD_MPHEAL, 3);
end;
