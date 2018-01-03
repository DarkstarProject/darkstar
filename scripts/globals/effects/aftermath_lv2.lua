-----------------------------------
--
-- EFFECT_AFTERMATH_LV2
--
-----------------------------------
require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    local power = effect:getPower(); 
    if (effect:getSubPower() == 1) then
        target:addMod(MOD_ATT,power);
    elseif (effect:getSubPower() == 2) then
        target:addMod(MOD_ACC,power)
    elseif (effect:getSubPower() == 3) then
        target:addMod(MOD_MATT,power) 
    elseif (effect:getSubPower() == 4) then
        target:addMod(MOD_RATT,power)
    elseif (effect:getSubPower() == 5) then
        target:addMod(MOD_MACC,power)
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
        target:delMod(MOD_ATT,power);
    elseif (effect:getSubPower() == 2) then
        target:delMod(MOD_ACC,power)
    elseif (effect:getSubPower() == 3) then
        target:delMod(MOD_RACC,power) 
    elseif (effect:getSubPower() == 4) then
        target:delMod(MOD_RATT,power)
    elseif (effect:getSubPower() == 5) then
        target:delMod(MOD_MACC,power)
    end
end;