-----------------------------------
--
-- EFFECT_AFTERMATH_LV3
--
-----------------------------------
require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    local power = effect:getPower(); 
    if (effect:getSubPower() == 1) then
        target:addMod(MOD_DOUBLE_ATTACK,power);
    elseif (effect:getSubPower() == 2) then
        target:addMod(MOD_DA_DOUBLE_DAMAGE,power)
    end
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
    local power = effect:getPower(); 
    if (effect:getSubPower() == 1) then
        target:delMod(MOD_DOUBLE_ATTACK,power);
    elseif (effect:getSubPower() == 2) then
        target:delMod(MOD_DA_DOUBLE_DAMAGE,power)
    end
end;