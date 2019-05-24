-----------------------------------
--
-- dsp.effect.PROWESS : "Killer" effects bonus
--
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.VERMIN_KILLER, effect:getPower())
    target:addMod(dsp.mod.BIRD_KILLER, effect:getPower())
    target:addMod(dsp.mod.AMORPH_KILLER, effect:getPower())
    target:addMod(dsp.mod.LIZARD_KILLER, effect:getPower())
    target:addMod(dsp.mod.AQUAN_KILLER, effect:getPower())
    target:addMod(dsp.mod.PLANTOID_KILLER, effect:getPower())
    target:addMod(dsp.mod.BEAST_KILLER, effect:getPower())
    target:addMod(dsp.mod.UNDEAD_KILLER, effect:getPower())
    target:addMod(dsp.mod.ARCANA_KILLER, effect:getPower())
    target:addMod(dsp.mod.DRAGON_KILLER, effect:getPower())
    target:addMod(dsp.mod.DEMON_KILLER, effect:getPower())
    target:addMod(dsp.mod.EMPTY_KILLER, effect:getPower())
    -- target:addMod(dsp.mod.HUMANOID_KILLER, effect:getPower())
    target:addMod(dsp.mod.LUMORIAN_KILLER, effect:getPower())
    target:addMod(dsp.mod.LUMINION_KILLER, effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.VERMIN_KILLER, effect:getPower())
    target:delMod(dsp.mod.BIRD_KILLER, effect:getPower())
    target:delMod(dsp.mod.AMORPH_KILLER, effect:getPower())
    target:delMod(dsp.mod.LIZARD_KILLER, effect:getPower())
    target:delMod(dsp.mod.AQUAN_KILLER, effect:getPower())
    target:delMod(dsp.mod.PLANTOID_KILLER, effect:getPower())
    target:delMod(dsp.mod.BEAST_KILLER, effect:getPower())
    target:delMod(dsp.mod.UNDEAD_KILLER, effect:getPower())
    target:delMod(dsp.mod.ARCANA_KILLER, effect:getPower())
    target:delMod(dsp.mod.DRAGON_KILLER, effect:getPower())
    target:delMod(dsp.mod.DEMON_KILLER, effect:getPower())
    target:delMod(dsp.mod.EMPTY_KILLER, effect:getPower())
    -- target:delMod(dsp.mod.HUMANOID_KILLER, effect:getPower())
    target:delMod(dsp.mod.LUMORIAN_KILLER, effect:getPower())
    target:delMod(dsp.mod.LUMINION_KILLER, effect:getPower())
end