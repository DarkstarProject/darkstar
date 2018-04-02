-----------------------------------------
-- ID: 5638
-- Item: pogaca_+1
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Lizard Killer +12
-- Resist Paralyze +12
-- HP Recovered While Healing 6
-- MP Recovered While Healing 6
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,360,5638);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_LIZARD_KILLER, 12);
    target:addMod(MOD_PARALYZERES, 12);
    target:addMod(MOD_HPHEAL, 6);
    target:addMod(MOD_MPHEAL, 6);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_LIZARD_KILLER, 12);
    target:delMod(MOD_PARALYZERES, 12);
    target:delMod(MOD_HPHEAL, 6);
    target:delMod(MOD_MPHEAL, 6);
end;
