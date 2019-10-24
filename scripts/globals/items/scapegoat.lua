-----------------------------------------
-- ID: 5412
-- scapegoat
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local power = 1
    local duration = 1800

    if target:hasStatusEffect(dsp.effect.RERAISE) then
        local effect = target:getStatusEffect(dsp.effect.RERAISE)
        local oPower = effect:getPower()

        if oPower > power then
            target:messageBasic(dsp.msg.basic.NO_EFFECT)
        else
            target:delStatusEffect(dsp.effect.RERAISE)
            target:addStatusEffect(dsp.effect.RERAISE, power, 0, duration)
        end
    else
        target:addStatusEffect(dsp.effect.RERAISE, power, 0, duration)
    end
end
