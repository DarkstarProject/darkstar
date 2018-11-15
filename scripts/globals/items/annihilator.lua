-----------------------------------------
-- ID: 18336, 18337, 18649, 18663, 18677, 19758, 19851, 21260, 21261, 21267
-- Item: Annihilator
-----------------------------------------
require("scripts/globals/msg")
require("scripts/globals/npc_util")
-----------------------------------------

function onItemCheck(target)
    if target:getFreeSlotsCount() == 0 then
        return dsp.msg.basic.ITEM_UNABLE_TO_USE
    end

    return 0
end

function onItemUse(target)
    npcUtil.giveItem(target, { { 21327, 99 } })
end
