-----------------------------------------
-- ID: 15182
-- Item: Zoolater Hat
-- Item Effect: Pet gets meditate
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local pet = target:getPet()
    if (pet) then
        pet:addStatusEffect(dsp.effect.REGAIN, 15, 3, 15)
    else
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    end
end
