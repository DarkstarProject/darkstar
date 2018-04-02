-----------------------------------------
-- ID: 5583
-- Item: plate_of_patlican_salata_+1
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- Agility 5
-- Vitality -2
-- Evasion +7
-- hHP +3
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,5583);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_AGI, 5);
    target:addMod(MOD_VIT, -2);
    target:addMod(MOD_EVA, 7);
    target:addMod(MOD_HPHEAL, 3);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_AGI, 5);
    target:delMod(MOD_VIT, -2);
    target:delMod(MOD_EVA, 7);
    target:delMod(MOD_HPHEAL, 3);
end;
