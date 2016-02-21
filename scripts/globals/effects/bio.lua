-----------------------------------
--
--     EFFECT_BIO
--     
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    local power = effect:getPower();
    local subpower = effect:getSubPower();
    target:addMod(MOD_ATTP,-subpower);
    target:addMod(MOD_REGEN_DOWN, power);
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
    local subpower = effect:getSubPower();
    target:delMod(MOD_ATTP,-subpower);
    target:delMod(MOD_REGEN_DOWN, power);
end;
