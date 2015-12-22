-----------------------------------------
-- ID: 5619
-- Item: Bowl of Zesti Zoni
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- HP 10
-- MP 10
-- Strength 1
-- Dexterity 1
-- Vitality 1
-- Agility 1
-- MP Recovered while healing 1
-- HP Recovered while healing 1
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5619);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 10);
    target:addMod(MOD_MP, 10);
    target:addMod(MOD_STR, 1);
    target:addMod(MOD_DEX, 1);
    target:addMod(MOD_VIT, 1);
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_HPHEAL, 1);
    target:addMod(MOD_MPHEAL, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 10);
    target:delMod(MOD_MP, 10);
    target:delMod(MOD_STR, 1);
    target:delMod(MOD_DEX, 1);
    target:delMod(MOD_VIT, 1);
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_HPHEAL, 1);
    target:delMod(MOD_MPHEAL, 1);
end;
