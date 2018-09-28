-----------------------------------------
-- ID: 4159
-- Item: Paralyze Potion
-- Item Effect: This potion induces paralyze.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if (not target:hasStatusEffect(dsp.effect.PARALYSIS)) then
        target:addStatusEffect(dsp.effect.PARALYSIS,20,0,180)
    else
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    end
end
