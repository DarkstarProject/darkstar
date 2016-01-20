-----------------------------------
--
--  EFFECT_VIT_BOOST
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_VIT,effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    -- the effect loses vitality of 1 every 3 ticks depending on the source of the boost
    local boostVIT_effect_size = effect:getPower();
    if (boostVIT_effect_size > 0) then
        effect:setPower(boostVIT_effect_size - 1)
        target:delMod(MOD_VIT,1); 
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    local boostVIT_effect_size = effect:getPower();
    if (boostVIT_effect_size > 0) then
        target:delMod(MOD_VIT,boostVIT_effect_size);
    end
end;
