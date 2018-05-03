-----------------------------------------
-- ID: 4493
-- Item: cup_of_windurstian_tea
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Vitality -2
-- Charisma 1
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effect.FOOD) == true or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4493);
end;

function onEffectGain(target, effect)
    target:addMod(dsp.mod.VIT, -2);
    target:addMod(dsp.mod.CHR, 1);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.VIT, -2);
    target:delMod(dsp.mod.CHR, 1);
end;
