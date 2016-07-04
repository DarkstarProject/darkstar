-----------------------------------
--
--     EFFECT_SIGNET
--
--   Signet is a a beneficial Status Effect that allows the acquisition of Conquest Points and Crystals 
--   from defeated enemies that grant Experience Points.

--   Increased Healing HP
--   No TP loss while resting
--   Bonus experience earned in smaller parties
-- X Increased defense and evasion against attacks from your auto-attack target 
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEF,15);
    target:addMod(MOD_EVA,15);
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
    target:delMod(MOD_DEF,15);
    target:delMod(MOD_EVA,15);
end;