-----------------------------------------
-- ID: 14490
-- mana_tunic
-----------------------------------------
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    if target:getMP() == target:getMaxMP() then
        return dsp.msg.basic.ITEM_UNABLE_TO_USE
    end
    return 0
end

function onItemUse(target)
    local mpHeal = math.random(30, 40)
    local dif = target:getMaxMP() - target:getMP()
    if mpHeal > dif then
        mpHeal = dif
    end
    target:addMP(mpHeal)
    target:messageBasic(dsp.msg.basic.RECOVERS_MP, 0, mpHeal)
end
