-----------------------------------------
-- ID: 4246
-- Item: Cantarella
-- Item Effect: Poison 10HP / Removes 2000 HP over 10 minutes
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if not target:hasStatusEffect(tpz.effect.POISON) then
        target:addStatusEffect(tpz.effect.POISON, 10, 3, 600)
    else
        target:messageBasic(tpz.msg.basic.NO_EFFECT)
    end
end
