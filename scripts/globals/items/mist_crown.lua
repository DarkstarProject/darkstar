-----------------------------------------
-- ID: 15526
-- Item: Mist Slacks
-- Item Effect: Evasion Boost
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if (not target:hasStatusEffect(dsp.effect.EVASION_BOOST)) then
        target:addStatusEffect(dsp.effect.EVASION_BOOST,15,0,180)
    else
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    end
end
