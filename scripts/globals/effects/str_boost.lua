-----------------------------------
--
--  EFFECT_STR_BOOST
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR,effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    -- the effect loses strengh of 1 every 3 ticks depending on the source of the boost
    local boostSTR_effect_size = effect:getPower();
    if (boostSTR_effect_size > 0) then
        effect:setPower(boostSTR_effect_size - 1)
        target:delMod(MOD_STR,1); 
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    local boostSTR_effect_size = effect:getPower();
    if (boostSTR_effect_size > 0) then
        target:delMod(MOD_STR,boostSTR_effect_size);
    end
end;
