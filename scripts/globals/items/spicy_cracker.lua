-----------------------------------------
-- ID: 4466
-- Item: spicy_cracker
-- Food Effect: 3Min, All Races
-----------------------------------------
-- HP Recovered While Healing 7
-- Beast Killer +10
-- Resist Sleep +10
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,180,4466);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HPHEAL, 7);
    target:addMod(MOD_BEAST_KILLER, 10);
    target:addMod(MOD_SLEEPRES, 10);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HPHEAL, 7);
    target:delMod(MOD_BEAST_KILLER, 10);
    target:delMod(MOD_SLEEPRES, 10);
end;
