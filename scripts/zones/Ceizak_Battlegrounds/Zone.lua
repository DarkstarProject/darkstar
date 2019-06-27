-----------------------------------
--
-- Zone: Ceizak Battlegrounds (261)
--
-----------------------------------
local ID = require("scripts/zones/Ceizak_Battlegrounds/IDs")
-----------------------------------

function onInitialize(zone)
end

function onZoneIn(player,prevZone)
    local cs = -1
    local onwardToAdoulin = player:getCurrentMission(SOA) == dsp.mission.id.soa.ONWARD_TO_ADOULIN

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(431,0,178,110)
    end

    if onwardToAdoulin then
        cs = 3
    end

    return cs;
end;

function onRegionEnter(player,region)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 3 then
        player:completeMission(SOA,dsp.mission.id.soa.ONWARD_TO_ADOULIN)
        player:addMission(SOA,dsp.mission.id.soa.HEARTWINGS_AND_THE_KINDHEARTED)
    end
end
