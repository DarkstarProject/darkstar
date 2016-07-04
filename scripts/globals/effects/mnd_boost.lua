-----------------------------------
--
--  EFFECT_MND_BOOST
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MND,effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    -- the effect loses mind of 1 every 3 ticks depending on the source of the boost
    local boostMND_effect_size = effect:getPower();
    if (boostMND_effect_size > 0) then
        effect:setPower(boostMND_effect_size - 1)
        target:delMod(MOD_MND,1); 
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    local boostMND_effect_size = effect:getPower();
    if (boostMND_effect_size > 0) then
        target:delMod(MOD_MND,boostMND_effect_size);
    end
end;
