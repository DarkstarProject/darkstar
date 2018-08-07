-----------------------------------
--
-- dsp.effect.PROWESS : Increased treasure casket discovery.
--
-----------------------------------

function onEffectGain(target,effect)
-- This might not be % in retail...If not a % just change ATTP to just ATT
    target:addMod(dsp.mod.ATTP, effect:getPower())
    target:addMod(dsp.mod.RATTP, effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.ATTP, effect:getPower())
    target:delMod(dsp.mod.RATTP, effect:getPower())
end