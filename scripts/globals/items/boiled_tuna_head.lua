-----------------------------------------
-- ID: 4540
-- Item: Boiled Tuna Head
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Magic 20
-- Dexterity 3
-- Intelligence 4
-- Mind -3
-- Magic Regen While Healing 2
-- Evasion 5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,4540);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MP, 20);
    target:addMod(MOD_DEX, 3);
    target:addMod(MOD_INT, 4);
    target:addMod(MOD_MND, -3);
    target:addMod(MOD_MPHEAL, 2);
    target:addMod(MOD_EVA, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_MP, 20);
    target:delMod(MOD_DEX, 3);
    target:delMod(MOD_INT, 4);
    target:delMod(MOD_MND, -3);
    target:delMod(MOD_MPHEAL, 2);
    target:delMod(MOD_EVA, 5);
end;
