-----------------------------------------
-- Qiqirn Mine
-- ID 5331
-- Summons a mine to blowup
-----------------------------------------
local ID = require("scripts/zones/Lebros_Cavern/IDs")
require("scripts/globals/status")
require("scripts/globals/zone")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if target:getZoneID() == LEBROS_CAVERN then
        result = 308
    end
    return result
end

function onItemUse(target,npc,mob)
    local instance = target:getInstance()

    instance:getEntity(bit.band(ID.npc.QIQIRN_MINE1, 0xFFF), dsp.objType.NPC):setStatus(dsp.status.NORMAL)
    instance:getEntity(bit.band(ID.npc.QIQIRN_MINE2, 0xFFF), dsp.objType.NPC):setStatus(dsp.status.NORMAL)
    instance:getEntity(bit.band(ID.npc.QIQIRN_MINE3, 0xFFF), dsp.objType.NPC):setStatus(dsp.status.NORMAL)
    instance:getEntity(bit.band(ID.npc.QIQIRN_MINE4, 0xFFF), dsp.objType.NPC):setStatus(dsp.status.NORMAL)

end