-----------------------------------------
-- ID: 5158
-- Item: Vermillion Jelly
-- Food Effect: 4 hours, All Races
-----------------------------------------
-- MP +12%(Cap: 90@750 Base MP)
-- Intelligence +6
-- MP Recovered While Healing +2
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
   target:addStatusEffect(EFFECT_FOOD,0,0,14400,5158);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
   target:addMod(MOD_FOOD_MPP, 12);
   target:addMod(MOD_FOOD_MP_CAP, 90);
   target:addMod(MOD_INT, 6);
   target:addMod(MOD_MPHEAL, 2);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
   target:delMod(MOD_FOOD_MPP,12);
   target:delMod(MOD_FOOD_MP_CAP, 90);
   target:delMod(MOD_INT, 6);
   target:delMod(MOD_MPHEAL, 2);
end;
