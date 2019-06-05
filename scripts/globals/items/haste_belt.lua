-----------------------------------------
-- ID: 15290
-- Item: Haste Belt
-- Item Effect: 10% haste
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if not target:hasStatusEffect(dsp.effect.HASTE) then
        target:addStatusEffect(dsp.effect.HASTE, 1000, 0, 180)
    else
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    end
end
