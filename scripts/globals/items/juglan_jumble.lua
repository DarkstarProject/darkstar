-----------------------------------------
-- ID: 5923
-- Item: Juglan Jumble
-- Food Effect: 5 Min, All Races
-----------------------------------------
-- HP Healing 5
-- MP Healing 8
-- Bird Killer 12
-- Resist Paralyze 12
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,5923);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HPHEAL, 5);
    target:addMod(MOD_MPHEAL, 8);
    target:addMod(MOD_BIRD_KILLER, 12);
    target:addMod(MOD_PARALYZERES, 12);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HPHEAL, 5);
    target:delMod(MOD_MPHEAL, 8);
    target:delMod(MOD_BIRD_KILLER, 12);
    target:delMod(MOD_PARALYZERES, 12);
end;
