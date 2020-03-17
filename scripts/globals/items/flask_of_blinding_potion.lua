-----------------------------------------
-- ID: 4163
-- Item: Blinding Potion
-- Item Effect: This potion induces blindness.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if (not target:hasStatusEffect(tpz.effect.BLINDNESS)) then
        target:addStatusEffect(tpz.effect.BLINDNESS,25,0,180)
    else
        target:messageBasic(tpz.msg.basic.NO_EFFECT)
    end
end
