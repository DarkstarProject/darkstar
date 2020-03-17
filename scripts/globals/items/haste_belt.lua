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
    if not target:hasStatusEffect(tpz.effect.HASTE) then
        target:addStatusEffect(tpz.effect.HASTE, 1000, 0, 180)
    else
        target:messageBasic(tpz.msg.basic.NO_EFFECT)
    end
end
