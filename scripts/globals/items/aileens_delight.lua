-----------------------------------------
-- ID: 5674
-- Item: Aileen's Delight
-- Food Effect: 60 Min, All Races
-----------------------------------------
-- HP +50
-- MP +50
-- STR +4
-- DEX +4
-- VIT +4
-- AGI +4
-- INT +4
-- MND +4
-- CHR +4
-- MP recovered while healing +2
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD)) then
        result = 246;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5674);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 50)
    target:addMod(MOD_MP, 50)
    target:addMod(MOD_STR, 4)
    target:addMod(MOD_DEX, 4)
    target:addMod(MOD_VIT, 4)
    target:addMod(MOD_AGI, 4)
    target:addMod(MOD_INT, 4)
    target:addMod(MOD_MND, 4)
    target:addMod(MOD_CHR, 4)
    target:addMod(MOD_MPHEAL, 2)
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 50)
    target:delMod(MOD_MP, 50)
    target:delMod(MOD_STR, 4)
    target:delMod(MOD_DEX, 4)
    target:delMod(MOD_VIT, 4)
    target:delMod(MOD_AGI, 4)
    target:delMod(MOD_INT, 4)
    target:delMod(MOD_MND, 4)
    target:delMod(MOD_CHR, 4)
    target:delMod(MOD_MPHEAL, 2)
end;
