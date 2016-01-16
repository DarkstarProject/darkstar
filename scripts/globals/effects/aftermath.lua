-----------------------------------
--
-- EFFECT_AFTERMATH
--
-----------------------------------
require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    local power = effect:getPower(); 
    if (effect:getSubPower() == 1) then
        target:addMod(MOD_SUBTLE_BLOW,power);
    elseif (effect:getSubPower() == 2) then
        target:addMod(MOD_CRITHITRATE,power)
    elseif (effect:getSubPower() == 3) then
        target:addMod(MOD_REGEN,power) 
    elseif (effect:getSubPower() == 4) then
        target:addMod(MOD_ATTP,power)
    elseif (effect:getSubPower() == 5) then
        target:addMod(MOD_DMG,power)
    elseif (effect:getSubPower() == 6) then
        target:addMod(MOD_HASTE_GEAR,power)
    elseif (effect:getSubPower() == 7) then
        target:addMod(MOD_SPIKES,5)
        target:addMod(MOD_SPIKES_DMG,power)
    elseif (effect:getSubPower() == 8) then
        target:addMod(MOD_STORETP,power)
    elseif (effect:getSubPower() == 9) then
        target:addMod(MOD_ACC,power)
    elseif (effect:getSubPower() == 10) then
        target:addMod(MOD_REFRESH,power)
    elseif (effect:getSubPower() == 11) then
        target:addMod(MOD_ENMITY,power)
    elseif (effect:getSubPower() == 12) then
        target:addMod(MOD_RACC,power)
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
        target:delMod(MOD_SUBTLE_BLOW,power);
    elseif (effect:getSubPower() == 2) then
        target:delMod(MOD_CRITHITRATE,power)
    elseif (effect:getSubPower() == 3) then
        target:delMod(MOD_REGEN,power) 
    elseif (effect:getSubPower() == 4) then
        target:delMod(MOD_ATTP,power)
    elseif (effect:getSubPower() == 5) then
        target:delMod(MOD_DMG,power)
    elseif (effect:getSubPower() == 6) then
        target:delMod(MOD_HASTE_GEAR,power)
    elseif (effect:getSubPower() == 7) then
        target:delMod(MOD_SPIKES,5);
        target:delMod(MOD_SPIKES_DMG,power)
    elseif (effect:getSubPower() == 8) then
        target:delMod(MOD_STORETP,power)
    elseif (effect:getSubPower() == 9) then
        target:delMod(MOD_ACC,power)
    elseif (effect:getSubPower() == 10) then
        target:delMod(MOD_REFRESH,power)
    elseif (effect:getSubPower() == 11) then
        target:delMod(MOD_ENMITY,power)
    elseif (effect:getSubPower() == 12) then
        target:delMod(MOD_RACC,power)
    end
end;