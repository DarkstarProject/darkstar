-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target,effect)
    effect:setSubPower(effect:getPower()*(256/100))
    target:addMod(dsp.mod.UDMGPHYS, -effect:getPower())
    target:addMod(dsp.mod.UDMGBREATH, -effect:getPower())
    target:addMod(dsp.mod.UDMGMAGIC, -effect:getSubPower())
    target:addMod(dsp.mod.UDMGRANGE, -effect:getPower())
    target:addMod(dsp.mod.SLEEPRES, effect:getPower())
    target:addMod(dsp.mod.POISONRES, effect:getPower())
    target:addMod(dsp.mod.PARALYZERES, effect:getPower())
    target:addMod(dsp.mod.BLINDRES, effect:getPower())
    target:addMod(dsp.mod.SILENCERES, effect:getPower())
    target:addMod(dsp.mod.BINDRES, effect:getPower())
    target:addMod(dsp.mod.CURSERES, effect:getPower())
    target:addMod(dsp.mod.SLOWRES, effect:getPower())
    target:addMod(dsp.mod.STUNRES, effect:getPower())
    target:addMod(dsp.mod.CHARMRES, effect:getPower())
end

function onEffectTick(target,effect)
    if (effect:getTickCount() > ((effect:getDuration() / effect:getTick())/2)) then
        if (effect:getPower() > 2) then
            effect:setPower(effect:getPower() - 2)
            effect:setSubPower(effect:getSubPower() - 3)
            target:delMod(dsp.mod.UDMGPHYS, -2)
            target:delMod(dsp.mod.UDMGBREATH, -2)
            target:delMod(dsp.mod.UDMGMAGIC, -3)
            target:delMod(dsp.mod.UDMGRANGE, -2)
            target:delMod(dsp.mod.SLEEPRES, 2)
            target:delMod(dsp.mod.POISONRES, 2)
            target:delMod(dsp.mod.PARALYZERES, 2)
            target:delMod(dsp.mod.BLINDRES, 2)
            target:delMod(dsp.mod.SILENCERES, 2)
            target:delMod(dsp.mod.BINDRES, 2)
            target:delMod(dsp.mod.CURSERES, 2)
            target:delMod(dsp.mod.SLOWRES, 2)
            target:delMod(dsp.mod.STUNRES, 2)
            target:delMod(dsp.mod.CHARMRES, 2)
        end
    end
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.UDMGPHYS, -effect:getPower())
    target:delMod(dsp.mod.UDMGBREATH, -effect:getPower())
    target:delMod(dsp.mod.UDMGMAGIC, -effect:getSubPower())
    target:delMod(dsp.mod.UDMGRANGE, -effect:getPower())
    target:delMod(dsp.mod.SLEEPRES, effect:getPower())
    target:delMod(dsp.mod.POISONRES, effect:getPower())
    target:delMod(dsp.mod.PARALYZERES, effect:getPower())
    target:delMod(dsp.mod.BLINDRES, effect:getPower())
    target:delMod(dsp.mod.SILENCERES, effect:getPower())
    target:delMod(dsp.mod.BINDRES, effect:getPower())
    target:delMod(dsp.mod.CURSERES, effect:getPower())
    target:delMod(dsp.mod.SLOWRES, effect:getPower())
    target:delMod(dsp.mod.STUNRES, effect:getPower())
    target:delMod(dsp.mod.CHARMRES, effect:getPower())
end