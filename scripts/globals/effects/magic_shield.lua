-----------------------------------
--
-- 	Magic Shield BLOCKS all magic attacks
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if (effect:getPower() < 2) then
        target:addMod(MOD_UDMGMAGIC, -256);
    else
        target:addMod(MOD_MAGIC_ABSORB, 100);
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
        target:delMod(MOD_UDMGMAGIC, -256);
    else
        target:delMod(MOD_MAGIC_ABSORB, 100);
    end
end;