-----------------------------------------
-- ID: 5742
-- Item: Bottle of Buffalo Bonanza Milk
-- Item Effect: Restores 120 HP over 60 seconds.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if (not target:hasStatusEffect(dsp.effect.REGEN)) then
        target:addStatusEffect(dsp.effect.REGEN,2,1,60)
    else
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    end
end
