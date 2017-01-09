-----------------------------------------
-- ID: 5732
-- Item: plate_of_ratatouille_+1
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- Agility 6
-- Evasion 10
-- HP recovered while healing 3
-- MP recovered while healing 3
-- Undead Killer 10
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5732);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_AGI, 6);
    target:addMod(MOD_EVA, 10);
    target:addMod(MOD_HPHEAL, 3);
    target:addMod(MOD_MPHEAL, 3);
    target:addMod(MOD_UNDEAD_KILLER, 10);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_AGI, 6);
    target:delMod(MOD_EVA, 10);
    target:delMod(MOD_HPHEAL, 3);
    target:delMod(MOD_MPHEAL, 3);
    target:delMod(MOD_UNDEAD_KILLER, 10);
end;
