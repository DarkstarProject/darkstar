-----------------------------------
--
--    EFFECT_VELOCITY_SHOT
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_ATTP,-15);
    target:addMod(MOD_HASTE_ABILITY,-150);
    target:addMod(MOD_RATTP,15);
    target:addMod(MOD_RANGED_DELAYP,-10);
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
    target:delMod(MOD_ATTP,-15);
    target:delMod(MOD_HASTE_ABILITY,-150);
    target:delMod(MOD_RATTP,15);
    target:delMod(MOD_RANGED_DELAYP,-10);
end;