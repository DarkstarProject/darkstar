-----------------------------------------
-- ID: 6411
-- Item: Chocobo Chair
-- Item Effect: Grant Chocobo chair key item
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/msg")

local keyItemId = dsp.ki.CHOCOBO_CHAIR

function onItemCheck(target)
    if target:hasKeyItem(keyItemId) then
        return dsp.msg.basic.ALREADY_HAVE_KEY_ITEM,0,keyItemId
    end
    return 0
end

function onItemUse(target)
    target:addKeyItem(keyItemId)
    target:messageBasic(dsp.basic.OBTAINED_KEY_ITEM,6411,keyItemId)
end
