-----------------------------------
-- Area: Castle Oztroja
--  NPC: _47v (Handle)
-- Notes: Opens door _472 from behind
-- !pos -61 0 -36 151
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onTrigger(player,npc)
    local brassDoor = GetNPCByID(npc:getID() - 1)

    if player:getZPos() < -32 and npc:getAnimation() == dsp.anim.CLOSE_DOOR and brassDoor:getAnimation() == dsp.anim.CLOSE_DOOR then
        npc:openDoor(6.5)
        -- Should be a ~1 second delay here before the door opens
        brassDoor:openDoor(4.5)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end