-----------------------------------------
-- ID: 5731
-- Item: plate_of_ratatouille
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- Agility 5
-- Evasion 5
-- HP recovered while healing 2
-- MP recovered while healing 2
-- Undead Killer 5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5731);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_AGI, 5);
    target:addMod(MOD_EVA, 5);
    target:addMod(MOD_HPHEAL, 2);
    target:addMod(MOD_MPHEAL, 2);
    target:addMod(MOD_UNDEAD_KILLER, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_AGI, 5);
    target:delMod(MOD_EVA, 5);
    target:delMod(MOD_HPHEAL, 2);
    target:delMod(MOD_MPHEAL, 2);
    target:delMod(MOD_UNDEAD_KILLER, 5);
end;
