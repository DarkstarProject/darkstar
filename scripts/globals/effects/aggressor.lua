-----------------------------------
--
-- 	EFFECT_AGGRESSOR
-- 	
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   -- Add Ranged Attack bonus.
   local racc = effect:getPower();
   if racc > 0 then
       target:addMod(MOD_RACC, racc);
   end;

   target:addMod(MOD_ACC,25);
   target:addMod(MOD_EVA,-25);
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
   target:delMod(MOD_ACC,25);
   target:delMod(MOD_EVA,-25);
   
   -- Remove Ranged Attack bonus.
   local racc = effect:getPower();
   if racc > 0 then
       target:delMod(MOD_RACC, racc);
   end;
end;