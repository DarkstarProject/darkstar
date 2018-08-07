-----------------------------------
--
--
--
-----------------------------------

local stats_bits =
{
    dsp.mod.STR,
    dsp.mod.DEX,
    dsp.mod.VIT,
    dsp.mod.AGI,
    dsp.mod.INT,
    dsp.mod.MND,
    dsp.mod.CHR,
    dsp.mod.HPP,
    dsp.mod.MPP
}

function onEffectGain(target,effect)
    local power = effect:getPower()
    for statbit,mod in ipairs(stats_bits) do
        if bit.band(bit.lshift(1, statbit - 1), power) > 0 then
            if mod == dsp.mod.HPP or mod == dsp.mod.MPP then
                target:addMod(mod, -40)
            else
                target:addMod(mod, -30)
            end
        end
    end
    target:setStatDebilitation(power)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    local power = effect:getPower()
    for statbit,mod in ipairs(stats_bits) do
        if bit.band(bit.lshift(1, statbit - 1), power) > 0 then
            if mod == dsp.mod.HPP or mod == dsp.mod.MPP then
                target:delMod(mod, -40)
            else
                target:delMod(mod, -30)
            end
        end
    end
    target:setStatDebilitation(0)
end
