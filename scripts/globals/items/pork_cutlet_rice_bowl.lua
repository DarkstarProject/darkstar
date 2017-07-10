-----------------------------------------
-- ID: 6406
-- Item: pork_cutlet_rice_bowl
-- Food Effect: 180Min, All Races
-----------------------------------------
-- HP +60
-- MP +60
-- STR +7
-- VIT +3
-- AGI +5
-- INT -7
-- Fire resistance +20
-- Attack +23% (cap 125)
-- Ranged Attack +23% (cap 125)
-- Store TP +4
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,6406);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 60);
    target:addMod(MOD_MP, 60);
    target:addMod(MOD_STR, 7);
    target:addMod(MOD_VIT, 3);
    target:addMod(MOD_AGI, 5);
    target:addMod(MOD_INT, -7);
    target:addMod(MOD_FIRERES, 20);
    target:addMod(MOD_FOOD_ATTP, 23);
    target:addMod(MOD_FOOD_ATT_CAP, 125);
    target:addMod(MOD_FOOD_RATTP, 23);
    target:addMod(MOD_FOOD_RATT_CAP, 125);
    target:addMod(MOD_STORETP, 4);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 60);
    target:delMod(MOD_MP, 60);
    target:delMod(MOD_STR, 7);
    target:delMod(MOD_VIT, 3);
    target:delMod(MOD_AGI, 5);
    target:delMod(MOD_INT, -7);
    target:delMod(MOD_FIRERES, 20);
    target:delMod(MOD_FOOD_ATTP, 23);
    target:delMod(MOD_FOOD_ATT_CAP, 125);
    target:delMod(MOD_FOOD_RATTP, 23);
    target:delMod(MOD_FOOD_RATT_CAP, 125);
    target:delMod(MOD_STORETP, 4);
end;
