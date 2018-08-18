-----------------------------------
--
--     dsp.effect.LAST_RESORT
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(dsp.mod.ATTP, 25 + target:getMerit(dsp.merit.LAST_RESORT_EFFECT))
    target:addMod(dsp.mod.HASTE_ABILITY, target:getMod(dsp.mod.DESPERATE_BLOWS) + target:getMerit(dsp.merit.DESPERATE_BLOWS))

    -- Gear that affects this mod is handled by a Latent Effect because the gear must remain equipped
    target:addMod(dsp.mod.DEFP, -25 - target:getMerit(dsp.merit.LAST_RESORT_EFFECT))
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.ATTP, 25 + target:getMerit(dsp.merit.LAST_RESORT_EFFECT))
    target:delMod(dsp.mod.HASTE_ABILITY, target:getMod(dsp.mod.DESPERATE_BLOWS) + target:getMerit(dsp.merit.DESPERATE_BLOWS))
     -- Gear that affects this mod is handled by a Latent Effect because the gear must remain equipped
    target:delMod(dsp.mod.DEFP, -25 - target:getMerit(dsp.merit.LAST_RESORT_EFFECT))
end