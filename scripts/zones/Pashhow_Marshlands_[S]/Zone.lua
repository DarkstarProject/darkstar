-----------------------------------
--
-- Zone: Pashhow_Marshlands_[S] (90)
--
-----------------------------------
local ID = require("scripts/zones/Pashhow_Marshlands_[S]/IDs")
require("scripts/globals/chocobo")
require("scripts/globals/weather")
require("scripts/globals/status")
-----------------------------------

function onInitialize(zone)
    dsp.chocobo.initZone(zone)
end

function onZoneIn(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(547.841, 23.192, 696.323, 134)
    end

    return cs
end

function onRegionEnter(player, region)
end

function onZoneWeatherChange(weather)
    local npc = GetNPCByID(ID.npc.INDESCRIPT_MARKINGS_OFFSET + 1) -- Indescript Markings (BOOTS)
    if npc then
        if weather == dsp.weather.RAIN or weather == dsp.weather.THUNDER then
            npc:setStatus(dsp.status.DISAPPEAR)
        else
            npc:setStatus(dsp.status.NORMAL)
        end
    end

    npc = GetNPCByID(ID.npc.INDESCRIPT_MARKINGS_OFFSET + 2) -- Indescript Markings (BODY)
    if npc then
        if weather == dsp.weather.RAIN then
            npc:setStatus(dsp.status.DISAPPEAR)
        else
            npc:setStatus(dsp.status.NORMAL)
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
