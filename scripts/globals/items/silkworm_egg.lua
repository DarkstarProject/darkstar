-----------------------------------------
-- ID: 4526
-- Item: Silkworm Egg
-- Food Effect: 5 Mins, All Races
-----------------------------------------
-- HP 12
-- MP 12
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,4526);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 12);
    target:addMod(MOD_MP, 12);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 12);
    target:delMod(MOD_MP, 12);
end;
