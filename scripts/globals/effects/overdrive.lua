-----------------------------------
--
--     dsp.effect.OVERDRIVE
--
-----------------------------------
require("scripts/globals/status")

function onEffectGain(target, effect)
    target:addMod(dsp.mod.OVERLOAD_THRESH, 5000)
    local pet = target:getPet()
    if pet then
        pet:setLocalVar("overdrive", 1)
        pet:addMod(dsp.mod.HASTE_MAGIC, 2500)
        pet:addMod(dsp.mod.MAIN_DMG_RATING, 30)
        pet:addMod(dsp.mod.RANGED_DMG_RATING, 30)
        pet:addMod(dsp.mod.ATTP, 50)
        pet:addMod(dsp.mod.RATTP, 50)
        pet:addMod(dsp.mod.ACC, 100)
        pet:addMod(dsp.mod.RACC, 100)
        pet:addMod(dsp.mod.EVA, 50)
        pet:addMod(dsp.mod.MEVA, 50)
        pet:addMod(dsp.mod.REVA, 50)
        pet:addMod(dsp.mod.DMG, -50)
    end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.OVERLOAD_THRESH, 5000)
    local pet = target:getPet()
    if pet and pet:getLocalVar("overdrive") ~= 0 then
        pet:setLocalVar("overdrive", 0)
        pet:delMod(dsp.mod.HASTE_MAGIC, 2500)
        pet:delMod(dsp.mod.MAIN_DMG_RATING, 30)
        pet:delMod(dsp.mod.RANGED_DMG_RATING, 30)
        pet:delMod(dsp.mod.ATTP, 50)
        pet:delMod(dsp.mod.RATTP, 50)
        pet:delMod(dsp.mod.ACC, 100)
        pet:delMod(dsp.mod.RACC, 100)
        pet:delMod(dsp.mod.EVA, 50)
        pet:delMod(dsp.mod.MEVA, 50)
        pet:delMod(dsp.mod.REVA, 50)
        pet:delMod(dsp.mod.DMG, -50)
    end
end