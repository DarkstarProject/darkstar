-----------------------------------------
-- ID: 5826
-- Item: Lucid Potion III
-- Item Effect: Restores 2000 HP
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    target:messageBasic(dsp.msg.basic.RECOVERS_HP,0,target:addHP(2000*ITEM_POWER))
end