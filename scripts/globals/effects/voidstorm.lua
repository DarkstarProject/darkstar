-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.STR,math.floor(effect:getPower()/2))
    target:addMod(dsp.mod.DEX,math.floor(effect:getPower()/2))
    target:addMod(dsp.mod.VIT,math.floor(effect:getPower()/2))
    target:addMod(dsp.mod.AGI,math.floor(effect:getPower()/2))
    target:addMod(dsp.mod.INT,math.floor(effect:getPower()/2))
    target:addMod(dsp.mod.MND,math.floor(effect:getPower()/2))
    target:addMod(dsp.mod.CHR,math.floor(effect:getPower()/2))
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.STR,math.floor(effect:getPower()/2))
    target:delMod(dsp.mod.DEX,math.floor(effect:getPower()/2))
    target:delMod(dsp.mod.VIT,math.floor(effect:getPower()/2))
    target:delMod(dsp.mod.AGI,math.floor(effect:getPower()/2))
    target:delMod(dsp.mod.INT,math.floor(effect:getPower()/2))
    target:delMod(dsp.mod.MND,math.floor(effect:getPower()/2))
    target:delMod(dsp.mod.CHR,math.floor(effect:getPower()/2))
end