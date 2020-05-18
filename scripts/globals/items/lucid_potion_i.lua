-----------------------------------------
-- ID: 5824
-- Item: Lucid Potion I
-- Item Effect: Restores 500 HP
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    target:messageBasic(dsp.msg.basic.RECOVERS_HP,0,target:addHP(500*ITEM_POWER))
end