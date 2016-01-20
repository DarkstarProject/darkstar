-----------------------------------
--
--  EFFECT_INT_BOOST
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_INT,effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    -- the effect loses intelligence of 1 every 3 ticks depending on the source of the boost
    local boostINT_effect_size = effect:getPower();
    if (boostINT_effect_size > 0) then
        effect:setPower(boostINT_effect_size - 1)
        target:delMod(MOD_INT,1); 
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    local boostINT_effect_size = effect:getPower();
    if (boostINT_effect_size > 0) then
        target:delMod(MOD_INT,boostINT_effect_size);
    end
end;
