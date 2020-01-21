-----------------------------------
--
-- Zone: Silver_Sea_route_to_Nashmau
--
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_route_to_Nashmau/IDs")
-----------------------------------

function onInitialize(zone)
end

function onZoneIn(player,prevZone)
    local cs = -1
    -- Gets current vanadiel time and compares it with arrival time to start a timer to show a message before it docks.
    local vHour = VanadielHour()
    local vMin  = VanadielMinute()
    local dockHour
    local dockMin = 40
    if vHour < 5 then
        dockHour = 4
    elseif vHour < 13 then
        dockHour = 12
    elseif vHour < 21 then
        dockHour = 20
    end
    local earthSecsAtZoneIn = math.floor(2.4 * ((vHour * 60) + vMin))
    local earthSecsAtDocking = math.floor(2.4 * ((dockHour * 60) + dockMin))
    local earthSecsUntilDock = math.floor(earthSecsAtDocking - earthSecsAtZoneIn)
    player:timer(math.floor(1000 * earthSecsUntilDock), function(player) player:messageSpecial(ID.DOCKING_IN_NASHMAU) end)
    return cs
end

function onTransportEvent(player,transport)
    player:startEvent(1025)
end

function onRegionEnter(player,region)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if (csid == 1025) then
        player:setPos(0,0,0,0,53)
    end
end