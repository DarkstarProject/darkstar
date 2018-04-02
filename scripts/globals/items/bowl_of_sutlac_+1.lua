-----------------------------------------
-- ID: 5578
-- Item: Bowl of Sutlac
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP +10
-- MP +10
-- INT +2
-- HP Recovered while healing +1
-- MP Recovered while healing +1
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,5578);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 10);
    target:addMod(MOD_MP, 10);
    target:addMod(MOD_INT, 2);
    target:addMod(MOD_HPHEAL, 1);
    target:addMod(MOD_MPHEAL, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 10);
    target:delMod(MOD_MP, 10);
    target:delMod(MOD_INT, 2);
    target:delMod(MOD_HPHEAL, 1);
    target:delMod(MOD_MPHEAL, 1);
end;
