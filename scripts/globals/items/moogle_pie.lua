-----------------------------------------
-- ID: 5561
-- Item: Moogle Pie
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- HP 20
-- MP 20
-- Strength 1
-- Dexterity 1
-- Vitality 1
-- Agility 1
-- Intelligence 1
-- Mind 1
-- Charisma 1
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5561);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 20);
    target:addMod(MOD_MP, 20);
    target:addMod(MOD_STR,1);
    target:addMod(MOD_DEX, 1);
    target:addMod(MOD_VIT,1);    
    target:addMod(MOD_AGI,1);
    target:addMod(MOD_INT, 1);
    target:addMod(MOD_MND,1);
    target:addMod(MOD_CHR, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 20);
    target:delMod(MOD_MP, 20);
    target:delMod(MOD_STR,1);
    target:delMod(MOD_DEX, 1);
    target:delMod(MOD_VIT,1);    
    target:delMod(MOD_AGI,1);
    target:delMod(MOD_INT, 1);
    target:delMod(MOD_MND,1);
    target:delMod(MOD_CHR, 1);
end;
