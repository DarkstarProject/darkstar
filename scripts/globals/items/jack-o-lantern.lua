-----------------------------------------
-- ID: 4488
-- Item: jack-o-lantern
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Charisma -10
-- Accuracy 10
-- Ranged Acc 10
-- Evasion 10
-- Arcana Killer 4
-- Dark Res 25
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,4488);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_CHR, -10);
    target:addMod(MOD_ACC, 10);
    target:addMod(MOD_RACC, 10);
    target:addMod(MOD_EVA, 10);
    target:addMod(MOD_ARCANA_KILLER, 4);
    target:addMod(MOD_DARKRES, 25);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_CHR, -10);
    target:delMod(MOD_ACC, 10);
    target:delMod(MOD_RACC, 10);
    target:delMod(MOD_EVA, 10);
    target:delMod(MOD_ARCANA_KILLER, 4);
    target:delMod(MOD_DARKRES, 25);
end;
