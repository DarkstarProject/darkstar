
local Arrapago = require("scripts/zones/Arrapago_Remnants/IDs")

function onTrigger(entity, npc)
    if (npc:getInstance():getStage() == 1) then
        entity:startEvent(300)
    else
        entity:messageSpecial(Arrapago.text.DOOR_IS_SEALED)
    end
end

function onEventFinish(entity, eventid, result, door)
    if (eventid == 300 and result == 1) then
        door:getInstance():setStage(2)
        door:setAnimation(8)
        door:untargetable(true)
    end
end
