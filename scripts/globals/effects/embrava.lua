-----------------------------------
--
--
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    local regen = effect:getPower();
    local refresh = effect:getSubPower();
    local haste = effect:getTier()
    
    target:addMod(MOD_REGEN, regen);
    target:addMod(MOD_REFRESH, refresh);
    target:addMod(MOD_HASTE_MAGIC, haste);
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
    local regen = effect:getPower();
    local refresh = effect:getSubPower();
    local haste = effect:getTier()
    
    target:delMod(MOD_REGEN, regen);
    target:delMod(MOD_REFRESH, refresh);
    target:delMod(MOD_HASTE_MAGIC, haste);
end;