-----------------------------------------
-- ID: 4510
-- Item: Acorn Cookie
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Magic Regen While Healing 3
-- Aquan Killer 5
-- Sleep Resist 5
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
    target:addMod(MOD_MPHEAL, 3);
    target:addMod(MOD_AQUAN_KILLER, 5);
    target:addMod(MOD_SLEEPRES, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_MPHEAL, 3);
    target:delMod(MOD_AQUAN_KILLER, 5);
    target:delMod(MOD_SLEEPRES, 5);
end;
