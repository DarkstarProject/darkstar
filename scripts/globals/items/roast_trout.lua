-----------------------------------------
-- ID: 4404
-- Item: roast_trout
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Dexterity 3
-- Mind -1
-- Ranged ATT % 14 (cap 50)
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,4404);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_DEX, 3);
    target:addMod(MOD_MND, -1);
    target:addMod(MOD_RATTP, 14);
    target:addMod(MOD_RATT_CAP, 50);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, 3);
    target:delMod(MOD_MND, -1);
    target:delMod(MOD_RATTP, 14);
    target:delMod(MOD_RATT_CAP, 50);
end;
