-----------------------------------
--
--     dsp.effect.SIGNET
--
--   Signet is a a beneficial Status Effect that allows the acquisition of Conquest Points and Crystals
--   from defeated enemies that grant Experience Points.

--   Increased Healing HP
--   No TP loss while resting
--   Bonus experience earned in smaller parties
-- X Increased defense and evasion against attacks from your auto-attack target
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEF,15)
    target:addMod(dsp.mod.EVA,15)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.DEF,15)
    target:delMod(dsp.mod.EVA,15)
end