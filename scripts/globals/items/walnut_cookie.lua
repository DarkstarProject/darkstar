-----------------------------------------
-- ID: 5922
-- Item: Walnut Cookie
-- Food Effect: 3 Min, All Races
-----------------------------------------
-- HP Healing 3
-- MP Healing 6
-- Bird Killer 10
-- Resist Paralyze 10
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,180,5922);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HPHEAL, 3);
    target:addMod(MOD_MPHEAL, 6);
    target:addMod(MOD_BIRD_KILLER, 10);
    target:addMod(MOD_PARALYZERES, 10);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HPHEAL, 3);
    target:delMod(MOD_MPHEAL, 6);
    target:delMod(MOD_BIRD_KILLER, 10);
    target:delMod(MOD_PARALYZERES, 10);
end;
