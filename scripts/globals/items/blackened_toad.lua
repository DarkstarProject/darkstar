-----------------------------------------
-- ID: 4599
-- Item: Blackened Toad
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Dexterity 2
-- Agility 2
-- Mind -1
-- Poison Resist 4
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,4599);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 2);
    target:addMod(MOD_AGI, 2);
    target:addMod(MOD_MND, -1);
    target:addMod(MOD_POISONRES, 4);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, 2);
    target:delMod(MOD_AGI, 2);
    target:delMod(MOD_MND, -1);
    target:delMod(MOD_POISONRES, 4);
end;
