-----------------------------------------
-- ID: 6009
-- Item: Bowl of Mog Pudding
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP 7
-- MP 7
-- Vitality 3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,6009);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 7);
    target:addMod(MOD_MP, 7);
    target:addMod(MOD_VIT, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 7);
    target:delMod(MOD_MP, 7);
    target:delMod(MOD_VIT, 3);
end;
