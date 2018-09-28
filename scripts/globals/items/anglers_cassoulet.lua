-----------------------------------------
-- ID: 5704
-- Item: anglers_cassoulet
-- Food Effect: 30, All Races
-----------------------------------------
-- VIT -1
-- AGI +5
-- Ranged Accuracy +1
-- Regen +1
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------
function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effect.FOOD) == true or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------
function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5704);
end;

----------------------------------------
-- onEffectGain
----------------------------------------
function onEffectGain(target,effect)
    target:addMod(dsp.mod.REGEN, 1);
    target:addMod(dsp.mod.VIT, -1);
    target:addMod(dsp.mod.AGI, 5);
    target:addMod(dsp.mod.RACC, 5);
end

-----------------------------------------
-- onEffectLose Action
-----------------------------------------
function onEffectLose(target,effect)
    target:delMod(dsp.mod.REGEN, 1);
    target:delMod(dsp.mod.VIT, -1);
    target:delMod(dsp.mod.AGI, 5);
    target:delMod(dsp.mod.RACC, 5);
end;
