-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addPetMod(MOD_MAB, effect:getPower());
    target:addPetMod(MOD_MACC, effect:getPower());
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
    target:delPetMod(MOD_MAB, effect:getPower());
    target:delPetMod(MOD_MACC, effect:getPower());
end;