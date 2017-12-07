-----------------------------------------
-- ID: 5940
-- Item: Trail Cookie
-- Food Effect: 5Min, All Races
-----------------------------------------
-- MP Healing 5
-- Aquan Killer 12
-- Sleep Resist 10
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,300,5940);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_MPHEAL, 5);
    target:addMod(MOD_AQUAN_KILLER, 12);
    target:addMod(MOD_SLEEPRES, 10);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MPHEAL, 5);
    target:delMod(MOD_AQUAN_KILLER, 12);
    target:delMod(MOD_SLEEPRES, 10);
end;
