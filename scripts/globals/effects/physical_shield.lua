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
        target:addMod(MOD_UDMGPHYS, -100);
    else
        target:addMod(MOD_PHYS_ABSORB, 100);
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
        target:delMod(MOD_UDMGPHYS, -100);
    else
        target:delMod(MOD_PHYS_ABSORB, 100);
    end
end;