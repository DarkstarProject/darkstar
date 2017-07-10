-----------------------------------------
-- ID: 4280
-- Item: garlic_cracker_+1
-- Food Effect: 5Min, All Races
-----------------------------------------
-- HP recovered while healing +8
-- Undead Killer +12
-- Blind Resist +12
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
    target:addStatusEffect(EFFECT_FOOD,0,0,300,4280);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HPHEAL, 8);
    target:addMod(MOD_UNDEAD_KILLER, 12);
    target:addMod(MOD_BLINDRES, 12);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HPHEAL, 8);
    target:delMod(MOD_UNDEAD_KILLER, 12);
    target:delMod(MOD_BLINDRES, 12);
end;
