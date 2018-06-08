-----------------------------------
--
-- dsp.effect.CHR_BOOST
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.CHR,effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    -- the effect loses Charism of 1 every 3 ticks depending on the source of the boost
    local boostCHR_effect_size = effect:getPower();
    if (boostCHR_effect_size > 0) then
        effect:setPower(boostCHR_effect_size - 1)
        target:delMod(dsp.mod.CHR,1);
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    local boostCHR_effect_size = effect:getPower();
    if (boostCHR_effect_size > 0) then
        target:delMod(dsp.mod.CHR,boostCHR_effect_size);
    end
end;
