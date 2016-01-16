-----------------------------------------
-- ID: 5636
-- Item: shrimp_cracker_+1
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Vitality 2
-- HP Recovered While Healing 9
-- Amorph Killer 5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,300,5636);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_HPHEAL, 9);
    target:addMod(MOD_AMORPH_KILLER, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_HPHEAL, 9);
    target:delMod(MOD_AMORPH_KILLER, 5);
end;
