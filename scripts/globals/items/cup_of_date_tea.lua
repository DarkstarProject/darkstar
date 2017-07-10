-----------------------------------------
-- ID: 5926
-- Item: Cup of Date Tea
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- HP 20
-- MP 30
-- Vitality -1
-- Charisma 5
-- Intelligence 3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5926);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 20);
    target:addMod(MOD_MP, 30);
    target:addMod(MOD_VIT, -1);
    target:addMod(MOD_CHR, 5);
    target:addMod(MOD_INT, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 20);
    target:delMod(MOD_MP, 30);
    target:delMod(MOD_VIT, -1);
    target:delMod(MOD_CHR, 5);
    target:delMod(MOD_INT, 3);
end;
