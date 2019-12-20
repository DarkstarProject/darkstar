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
    if not target:hasStatusEffect(dsp.effect.POISON) then
        target:addStatusEffect(dsp.effect.POISON, 10, 3, 600)
    else
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    end
end
