-----------------------------------------
-- ID: 6413
-- Item: Astral Cube
-- Item Effect: Grant Astral cube key item
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/msg")

local keyItemId = dsp.ki.ASTRAL_CUBE

function onItemCheck(target)
    if target:hasKeyItem(keyItemId) then
        return dsp.msg.basic.ALREADY_HAVE_KEY_ITEM,0,keyItemId
    end
    return 0
end

function onItemUse(target)
    target:addKeyItem(keyItemId)
    target:messageBasic(dsp.basic.OBTAINED_KEY_ITEM,6413,keyItemId)
end
