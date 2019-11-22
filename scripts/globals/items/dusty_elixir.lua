-----------------------------------------
-- ID: 5433
-- Item: Dusty Elixir
-- Item Effect: Instantly restores 25% of HP and MP
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    target:addHP((target:getMaxHP()/100)*25)
    target:addMP((target:getMaxMP()/100)*25)
    target:messageBasic(dsp.msg.basic.RECOVERS_HP_AND_MP)
end