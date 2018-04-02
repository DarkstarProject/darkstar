-----------------------------------------
-- ID: 5930
-- Item: Bowl of Sprightly Soup
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- MP 30
-- Mind 4
-- HP Recovered While Healing 4
-- Enmity -4
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,5930);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MP, 30);
    target:addMod(MOD_MND, 4);
    target:addMod(MOD_HPHEAL, 4);
    target:addMod(MOD_ENMITY, -4);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MP, 30);
    target:delMod(MOD_MND, 4);
    target:delMod(MOD_HPHEAL, 4);
    target:delMod(MOD_ENMITY, -4);
end;
