-----------------------------------------
-- ID: 5636
-- Item: shrimp_cracker_+1
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Vitality 2
-- Defense +10
-- Amorph Killer 12
-- Resist Virus 12
-- HP Recovered While Healing 9
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,5636);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_DEF, 10);
    target:addMod(MOD_AMORPH_KILLER, 12);
    target:addMod(MOD_VIRUSRES, 12);
    target:addMod(MOD_HPHEAL, 9);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_DEF, 10);
    target:delMod(MOD_AMORPH_KILLER, 12);
    target:delMod(MOD_VIRUSRES, 12);
    target:delMod(MOD_HPHEAL, 9);
end;
