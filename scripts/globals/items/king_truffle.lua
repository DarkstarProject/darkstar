-----------------------------------------
-- ID: 4386
-- King Truffle
--  5 Minutes, food effect, All Races
-----------------------------------------
-- Strength -6
-- Mind     +4
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,4386);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR,-6);
    target:addMod(MOD_MND, 4);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_STR,-6);
    target:delMod(MOD_MND, 4);
end;