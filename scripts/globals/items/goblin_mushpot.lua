-----------------------------------------
-- ID: 4543
-- Item: goblin_mushpot
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Mind 10
-- Charisma -5
-- Poison Resist 4
-- Blind Resist 4
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,4543);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MND, 10);
    target:addMod(MOD_CHR, -5);
    target:addMod(MOD_POISONRES, 4);
    target:addMod(MOD_BLINDRES, 4);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MND, 10);
    target:delMod(MOD_CHR, -5);
    target:delMod(MOD_POISONRES, 4);
    target:delMod(MOD_BLINDRES, 4);
end;
