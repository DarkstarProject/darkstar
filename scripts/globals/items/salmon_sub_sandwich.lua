-----------------------------------------
-- ID: 4355
-- Item: salmon_sub_sandwich
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Dexterity 2
-- Agility 1
-- Vitality 1
-- Intelligence 2
-- Mind -2
-- Ranged ACC 2
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,4355);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 2);
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_VIT, 1);
    target:addMod(MOD_INT, 2);
    target:addMod(MOD_MND, -2);
    target:addMod(MOD_RACC, 2);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_DEX, 2);
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_VIT, 1);
    target:delMod(MOD_INT, 2);
    target:delMod(MOD_MND, -2);
    target:delMod(MOD_RACC, 2);
end;
