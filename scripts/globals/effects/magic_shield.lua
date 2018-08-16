-----------------------------------
--
-- Magic Shield BLOCKS all magic attacks
--
-----------------------------------

require("scripts/globals/status")

function onEffectGain(target,effect)
    if effect:getPower() == 3 then -- arcane stomp
        target:addMod(dsp.mod.FIRE_ABSORB, 100)
        target:addMod(dsp.mod.EARTH_ABSORB, 100)
        target:addMod(dsp.mod.WATER_ABSORB, 100)
        target:addMod(dsp.mod.WIND_ABSORB, 100)
        target:addMod(dsp.mod.ICE_ABSORB, 100)
        target:addMod(dsp.mod.LTNG_ABSORB, 100)
        target:addMod(dsp.mod.LIGHT_ABSORB, 100)
        target:addMod(dsp.mod.DARK_ABSORB, 100)
    elseif effect:getPower() < 2 then
        target:addMod(dsp.mod.UDMGMAGIC, -101)
        if target:isPC() and target:hasTrait(77) then -- Iron Will
            target:addMod(dsp.mod.SPELLINTERRUPT, target:getMerit(dsp.merit.IRON_WILL))
        end
    else
        target:addMod(dsp.mod.MAGIC_ABSORB, 100)
    end
end

function onEffectLose(target,effect)
    if effect:getPower() == 3 then -- arcane stomp
        target:delMod(dsp.mod.FIRE_ABSORB, 100)
        target:delMod(dsp.mod.EARTH_ABSORB, 100)
        target:delMod(dsp.mod.WATER_ABSORB, 100)
        target:delMod(dsp.mod.WIND_ABSORB, 100)
        target:delMod(dsp.mod.ICE_ABSORB, 100)
        target:delMod(dsp.mod.LTNG_ABSORB, 100)
        target:delMod(dsp.mod.LIGHT_ABSORB, 100)
        target:delMod(dsp.mod.DARK_ABSORB, 100)
    elseif effect:getPower() < 2 then
        target:delMod(dsp.mod.UDMGMAGIC, -101)
        if target:isPC() and target:hasTrait(77) then -- Iron Will
            target:delMod(dsp.mod.SPELLINTERRUPT, target:getMerit(dsp.merit.IRON_WILL))
        end
    else
        target:delMod(dsp.mod.MAGIC_ABSORB, 100)
    end
end
