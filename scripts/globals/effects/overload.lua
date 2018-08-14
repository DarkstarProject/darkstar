-----------------------------------
--
--     dsp.effect.OVERLOAD
--
-----------------------------------

function onEffectGain(target,effect)
    local pet = target:getPet()
    if pet then
        pet:setLocalVar("overload", 1)
        pet:addMod(dsp.mod.HASTE_MAGIC, -500)
        pet:addMod(dsp.mod.MOVE, -50)
        pet:addMod(dsp.mod.EVA, -10)
    end
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    local pet = target:getPet()
    if pet and pet:getLocalVar("overload") ~= 0 then
        pet:setLocalVar("overload", 0)
        pet:delMod(dsp.mod.HASTE_MAGIC, -500)
        pet:delMod(dsp.mod.MOVE, -50)
        pet:delMod(dsp.mod.EVA, -10)
    end
end