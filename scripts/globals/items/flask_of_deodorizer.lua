-----------------------------------------
-- ID: 4166
-- Deodorizer
-- When applied, this powerful deodorant neutralizes even the strongest of odors!!.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if (not target:hasStatusEffect(dsp.effect.DEODORIZE)) then
        target:addStatusEffect(dsp.effect.DEODORIZE,1,10,180)
    else
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    end
end
