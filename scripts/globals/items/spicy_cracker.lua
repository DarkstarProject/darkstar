-----------------------------------------
-- ID: 4466
-- Item: spicy_cracker
-- Food Effect: 3Min, All Races
-----------------------------------------
-- HP Recovered While Healing 7
-- Beast Killer
-- Resist Sleep
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
    target:addStatusEffect(EFFECT_FOOD,0,0,180,4466);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HPHEAL, 7);
    target:addMod(MOD_BEAST_KILLER, 5);
    target:addMod(MOD_SLEEPRES, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HPHEAL, 7);
    target:delMod(MOD_BEAST_KILLER, 5);
    target:delMod(MOD_SLEEPRES, 5);
end;
