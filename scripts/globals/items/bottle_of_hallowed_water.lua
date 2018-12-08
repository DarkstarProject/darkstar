-----------------------------------------
-- ID: 5306
-- Item: Bottle of Hallowed Water
-- Item Effect: Removes curse. Better chance to remove doom.
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local curse = target:getStatusEffect(dsp.effect.CURSE_I)
    local curse2 = target:getStatusEffect(dsp.effect.CURSE_II)
    local bane = target:getStatusEffect(dsp.effect.BANE)
    local power = 33 + target:getMod(dsp.mod.ENHANCES_HOLYWATER)

    if (target:hasStatusEffect(dsp.effect.DOOM) and power > math.random(1, 100)) then
        target:delStatusEffect(dsp.effect.DOOM)
        target:messageBasic(dsp.msg.basic.NARROWLY_ESCAPE)
    elseif (curse ~= nil and curse2 ~= nil and bane ~= nil) then
        target:delStatusEffect(dsp.effect.CURSE_I)
        target:delStatusEffect(dsp.effect.CURSE_II)
        target:delStatusEffect(dsp.effect.BANE)
    elseif (curse ~= nil and bane ~= nil) then
        target:delStatusEffect(dsp.effect.CURSE_I)
        target:delStatusEffect(dsp.effect.BANE)
    elseif (curse2 ~= nil and bane ~= nil) then
        target:delStatusEffect(dsp.effect.CURSE_II)
        target:delStatusEffect(dsp.effect.BANE)
    elseif (curse ~= nil) then
        target:delStatusEffect(dsp.effect.CURSE_I)
    elseif (curse2 ~= nil) then
        target:delStatusEffect(dsp.effect.CURSE_II)
    elseif (bane ~= nil) then
        target:delStatusEffect(dsp.effect.BANE)
    else
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    end
end
