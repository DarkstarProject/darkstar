-----------------------------------
--
-- EFFECT_SENTINEL
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_UDMGPHYS,-effect:getPower());
    target:addMod(MOD_ENMITY, 100);
    target:addMod(MOD_ENMITY_LOSS_REDUCTION, effect:getSubPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
   local power = effect:getPower();
   local decayby = 0;
   -- Damage reduction decays until 50% then stops
   if (power > 50) then
      -- final tick with feet just has to be odd.
      if (power == 55) then
         decayby = 5;
      -- decay by 8% per tick
      else
         decayby = 8;
      end
      effect:setPower(power-decayby);
      target:delMod(MOD_UDMGPHYS,-decayby);
   end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_UDMGPHYS,-effect:getPower());
    target:delMod(MOD_ENMITY, 100);
    target:delMod(MOD_ENMITY_LOSS_REDUCTION, effect:getSubPower());
end;