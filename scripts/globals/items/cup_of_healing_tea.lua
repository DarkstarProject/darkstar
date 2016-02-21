-----------------------------------------
-- ID: 4286
-- Item: cup_of_healing_tea
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Magic 10
-- Vitality -1
-- Charisma 3
-- Magic Regen While Healing 2
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,4286);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MP, 10);
    target:addMod(MOD_VIT, -1);
    target:addMod(MOD_CHR, 3);
    target:addMod(MOD_MPHEAL, 2);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_MP, 10);
    target:delMod(MOD_VIT, -1);
    target:delMod(MOD_CHR, 3);
    target:delMod(MOD_MPHEAL, 2);
end;
