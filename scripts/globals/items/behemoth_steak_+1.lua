-----------------------------------------
-- ID: 6465
-- Item: behemoth_steak_+1
-- Food Effect: 240Min, All Races
-----------------------------------------
-- HP +45
-- STR +8
-- DEX +8
-- INT -4
-- Attack +24% (cap 165)
-- Ranged Attack +24% (cap 165)
-- Triple Attack +2%
-- Lizard Killer +5
-- hHP +5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,6465);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 45);
    target:addMod(MOD_STR, 8);
    target:addMod(MOD_DEX, 8);
    target:addMod(MOD_INT, -4);
    target:addMod(MOD_FOOD_ATTP, 24);
    target:addMod(MOD_FOOD_ATT_CAP, 165);
    target:addMod(MOD_FOOD_RATTP, 24);
    target:addMod(MOD_FOOD_RATT_CAP, 165);
    target:addMod(MOD_TRIPLE_ATTACK, 2);
    target:addMod(MOD_LIZARD_KILLER, 5);
    target:addMod(MOD_HPHEAL, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 45);
    target:delMod(MOD_STR, 8);
    target:delMod(MOD_DEX, 8);
    target:delMod(MOD_INT, -4);
    target:delMod(MOD_FOOD_ATTP, 24);
    target:delMod(MOD_FOOD_ATT_CAP, 165);
    target:delMod(MOD_FOOD_RATTP, 24);
    target:delMod(MOD_FOOD_RATT_CAP, 165);
    target:delMod(MOD_TRIPLE_ATTACK, 2);
    target:delMod(MOD_LIZARD_KILLER, 5);
    target:delMod(MOD_HPHEAL, 5);
end;
