-----------------------------------
--
-- Zone: Meriphataud_Mountains_[S] (97)
--
-----------------------------------
local ID = require("scripts/zones/Meriphataud_Mountains_[S]/IDs")
require("scripts/globals/chocobo")
require("scripts/globals/status")
-----------------------------------

function onInitialize(zone)
    dsp.chocobo.initZone(zone)
end

function onZoneIn(player, prevZone)
    local cs = -1
    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-454.135, 28.409, 657.79, 49)
    end
    return cs
end

function onRegionEnter(player, region)
end

function onGameHour(zone)
    local npc = GetNPCByID(ID.npc.INDESCRIPT_MARKINGS)
    local hour = VanadielHour()

    if npc then
        if hour == 17 then
            npc:setStatus(dsp.status.DISAPPEAR)
        elseif hour == 7 then
            npc:setStatus(dsp.status.NORMAL)
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
