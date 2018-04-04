-----------------------------------------
-- ID: 5927
-- Item: Cup of Caravan Tea
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- HP 22
-- MP 32
-- Charisma 6
-- Intelligence 4
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,5927);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 22);
    target:addMod(MOD_MP, 32);
    target:addMod(MOD_CHR, 6);
    target:addMod(MOD_INT, 4);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 22);
    target:delMod(MOD_MP, 32);
    target:delMod(MOD_CHR, 6);
    target:delMod(MOD_INT, 4);
end;
