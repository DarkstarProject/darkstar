-----------------------------------------
-- ID: 6407
-- Item: pork_cutlet_rice_bowl_+1
-- Food Effect: 240Min, All Races
-----------------------------------------
-- HP +65
-- MP +65
-- STR +8
-- VIT +4
-- AGI +6
-- INT -8
-- Fire resistance +21
-- Attack +24% (cap 130)
-- Ranged Attack +24% (cap 130)
-- Store TP +5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,6407);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 65);
    target:addMod(MOD_MP, 65);
    target:addMod(MOD_STR, 8);
    target:addMod(MOD_VIT, 4);
    target:addMod(MOD_AGI, 6);
    target:addMod(MOD_INT, -8);
    target:addMod(MOD_FIRERES, 21);
    target:addMod(MOD_FOOD_ATTP, 24);
    target:addMod(MOD_FOOD_ATT_CAP, 130);
    target:addMod(MOD_FOOD_RATTP, 24);
    target:addMod(MOD_FOOD_RATT_CAP, 130);
    target:addMod(MOD_STORETP, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 65);
    target:delMod(MOD_MP, 65);
    target:delMod(MOD_STR, 8);
    target:delMod(MOD_VIT, 4);
    target:delMod(MOD_AGI, 6);
    target:delMod(MOD_INT, -8);
    target:delMod(MOD_FIRERES, 21);
    target:delMod(MOD_FOOD_ATTP, 24);
    target:delMod(MOD_FOOD_ATT_CAP, 130);
    target:delMod(MOD_FOOD_RATTP, 24);
    target:delMod(MOD_FOOD_RATT_CAP, 130);
    target:delMod(MOD_STORETP, 5);
end;
