-----------------------------------------
-- ID: 5143
-- Item: serving_of_goblin_stir-fry
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Agility 5
-- Vitality 2
-- Charisma -5
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,5143);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_AGI, 5);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_CHR, -5);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_AGI, 5);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_CHR, -5);
end;
