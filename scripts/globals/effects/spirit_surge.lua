-----------------------------------
--
-- dsp.effect.SPIRIT_SURGE
--
-----------------------------------
require("scripts/globals/status")

function onEffectGain(target, effect)
    -- The dragoon's MAX HP increases by % of wyvern MaxHP
    target:addMod(dsp.mod.HP, effect:getPower())
    target:updateHealth()
    target:addHP(effect:getPower())

    -- The dragoon gets a Strength boost relative to his level
    target:addMod(dsp.mod.STR, effect:getSubPower())

    -- The dragoon gets a 50 Accuracy boost
    target:addMod(dsp.mod.ACC, 50)

    -- The dragoon gets 25% Haste (see http://wiki.bluegartr.com/bg/Job_Ability_Haste for haste calculation)
    target:addMod(dsp.mod.HASTE_ABILITY, 2500)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    -- The dragoon's MAX HP returns to normal (when the MAXHP boost in onEffectGain() gets implemented)
    target:delMod(dsp.mod.HP, effect:getPower())

    -- The dragoon loses the Strength boost
    target:delMod(dsp.mod.STR, effect:getSubPower())

    -- The dragoon loses the 50 Accuracy boost
    target:delMod(dsp.mod.ACC, 50)

    -- The dragoon loses 25% Haste
    target:delMod(dsp.mod.HASTE_ABILITY, 2500)
end