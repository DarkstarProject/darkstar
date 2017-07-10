-----------------------------------------
-- ID: 5635
-- Item: shrimp_cracker
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Vitality 1
-- DEF +10
-- Amorph Killer 10
-- Resist Virus +10
-- HP Recovered While Healing 8
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,180,5635);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_VIT, 1);
    target:addMod(MOD_DEF, 10);
    target:addMod(MOD_AMORPH_KILLER, 10);
    target:addMod(MOD_VIRUSRES, 10);
    target:addMod(MOD_HPHEAL, 8);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_VIT, 1);
    target:delMod(MOD_DEF, 10);
    target:delMod(MOD_AMORPH_KILLER, 10);
    target:delMod(MOD_VIRUSRES, 10);
    target:delMod(MOD_HPHEAL, 8);
end;
