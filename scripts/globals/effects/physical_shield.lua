-----------------------------------
-- Physical Shield
-- Blocks all physical attacks
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if (effect:getPower() < 2) then
        target:addMod(dsp.mod.UDMGPHYS, -100);
    else
        target:addMod(dsp.mod.PHYS_ABSORB, 100);
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
    if (effect:getPower() < 2) then
        target:delMod(dsp.mod.UDMGPHYS, -100);
    else
        target:delMod(dsp.mod.PHYS_ABSORB, 100);
    end
end;