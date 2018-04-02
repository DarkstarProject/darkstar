-----------------------------------------
-- ID: 4494
-- Item: pot_of_san_dorian_tea
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Vitality -2
-- Charisma 2
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,4494);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_VIT, -2);
    target:addMod(MOD_CHR, 2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_VIT, -2);
    target:delMod(MOD_CHR, 2);
end;
