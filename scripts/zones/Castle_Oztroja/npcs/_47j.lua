-----------------------------------
-- Area: Castle Oztroja
--  NPC: _47j (Torch Stand)
-- Notes: Opens door _472 near password #1
-- !pos -62.533 -1.859 -30.634 151
-----------------------------------
local ID = require("scripts/zones/Castle_Oztroja/IDs")
require("scripts/globals/status")
-----------------------------------

function onTrigger(player,npc)
    local brassDoor = GetNPCByID(npc:getID() - 4)

    if npc:getAnimation() == dsp.anim.CLOSE_DOOR and brassDoor:getAnimation() == dsp.anim.CLOSE_DOOR then
        player:startEvent(10)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    local brassDoor = GetNPCByID(ID.npc.FIRST_PASSWORD_STATUE - 2)
    local torch1 = GetNPCByID(ID.npc.FIRST_PASSWORD_STATUE + 1)
    local torch2 = GetNPCByID(ID.npc.FIRST_PASSWORD_STATUE + 2)

    if option == 1 then
        torch1:openDoor(10)
        torch2:openDoor(10)
        brassDoor:openDoor(6)
    end

end