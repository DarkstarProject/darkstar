-----------------------------------------
-- ID: 4378
-- Item: Jug of Selbina Milk
-- Item Effect: regen: 1 HP/tick x 120sec, x 150sec w/ dream robe +1
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if (not target:hasStatusEffect(dsp.effect.REGEN)) then
        if (target:getEquipID(dsp.slot.BODY) == 14520) then -- Dream Robe +1
            target:addStatusEffect(dsp.effect.REGEN,1,3,150)
        else
            target:addStatusEffect(dsp.effect.REGEN,1,3,120)
        end
    else
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    end
end
