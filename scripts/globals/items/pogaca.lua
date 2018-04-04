-----------------------------------------
-- ID: 5637
-- Item: pogaca
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Lizard Killer +10
-- Resist Paralyze +10
-- HP Recovered While Healing 4
-- MP Recovered While Healing 4
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,5637);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_LIZARD_KILLER, 10);
    target:addMod(MOD_PARALYZERES, 10);
    target:addMod(MOD_HPHEAL, 4);
    target:addMod(MOD_MPHEAL, 4);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_LIZARD_KILLER, 10);
    target:delMod(MOD_PARALYZERES, 10);
    target:delMod(MOD_HPHEAL, 4);
    target:delMod(MOD_MPHEAL, 4);
end;
