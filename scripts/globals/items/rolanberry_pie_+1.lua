-----------------------------------------
-- ID: 4339
-- Item: rolanberry_pie_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Magic 60
-- Intelligence 3
-- Health Regen While Healing 1
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
        target:addStatusEffect(EFFECT_FOOD,0,0,3600,4339);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
        target:addMod(MOD_MP, 60);
        target:addMod(MOD_INT, 3);
        target:addMod(MOD_HPHEAL, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
        target:delMod(MOD_MP, 60);
        target:delMod(MOD_INT, 3);
        target:delMod(MOD_HPHEAL, 1);
end;
