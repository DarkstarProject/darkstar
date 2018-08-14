-----------------------------------------
-- ID: 6377
-- Item: Imperial Chair
-- Item Effect: Grant Imperial chair key item
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/msg")

local keyItemId = dsp.ki.IMPERIAL_CHAIR

function onItemCheck(target)
    if target:hasKeyItem(keyItemId) then
        return dsp.msg.basic.ALREADY_HAVE_KEY_ITEM,0,keyItemId
    end
    return 0
end

function onItemUse(target)
    target:addKeyItem(keyItemId)
    target:messageBasic(dsp.msg.basic.OBTAINED_KEY_ITEM,6377,keyItemId)
end
