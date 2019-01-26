-----------------------------------------
-- ID: 6412
-- Item: Leaf Bench
-- Item Effect: Grant Leaf bench key item
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/msg")

local keyItemId = dsp.ki.LEAF_BENCH

function onItemCheck(target)
    if target:hasKeyItem(keyItemId) then
        return dsp.msg.basic.ALREADY_HAVE_KEY_ITEM,0,keyItemId
    end
    return 0
end

function onItemUse(target)
    target:addKeyItem(keyItemId)
    target:messageBasic(dsp.basic.OBTAINED_KEY_ITEM,6412,keyItemId)
end
