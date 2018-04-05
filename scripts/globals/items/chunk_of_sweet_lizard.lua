-----------------------------------------
-- ID: 5738
-- Item: chunk_of_sweet_lizard
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP 5
-- MP 5
-- Dexterity 1
-- hHP +2
-- hMP +2
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5738);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 5);
    target:addMod(MOD_MP, 5);
    target:addMod(MOD_DEX, 1);
    target:addMod(MOD_HPHEAL, 2);
    target:addMod(MOD_MPHEAL, 2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 5);
    target:delMod(MOD_MP, 5);
    target:delMod(MOD_DEX, 1);
    target:delMod(MOD_HPHEAL, 2);
    target:delMod(MOD_MPHEAL, 2);
end;
