-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect) --power=30 initially, subpower=20 for enmity
    target:addMod(MOD_EVA,-effect:getPower());
    target:addMod(MOD_ENMITY,-effect:getSubPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    --tick down the effect and reduce the overall power
    effect:setPower(effect:getPower()-1);
    target:delMod(MOD_EVA,-1);
    if (effect:getPower() % 2 == 0) then -- enmity- decays from -20 to -10, so half as often as the rest.
        effect:setSubPower(effect:getSubPower()-1);
        target:delMod(MOD_ENMITY,-1);
    end;
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    --remove the remaining power
    target:delMod(MOD_EVA,-effect:getPower());
    target:delMod(MOD_ENMITY,-effect:getSubPower());
end;