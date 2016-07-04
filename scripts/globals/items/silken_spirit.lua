-----------------------------------------
-- ID: 5634
-- Item: Silken Spirit
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- MP +3%
-- MP Recovered while healing +7
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5634);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MPP, 3);
    target:addMod(MOD_MPHEAL, 7);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_MPP, 3);
    target:delMod(MOD_MPHEAL, 7);
end;
