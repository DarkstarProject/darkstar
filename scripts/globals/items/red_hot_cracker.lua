-----------------------------------------
-- ID: 4281
-- Item: red_hot_cracker
-- Food Effect: 3Min, All Races
-----------------------------------------
-- HP Recovered While Healing 9
-- Beast Killer 12
-- Resist Sleep 12
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,180,4281);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HPHEAL, 9);
    target:addMod(MOD_BEAST_KILLER, 12);
    target:addMod(MOD_SLEEPRES, 12);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HPHEAL, 9);
    target:delMod(MOD_BEAST_KILLER, 12);
    target:delMod(MOD_SLEEPRES, 12);
end;
