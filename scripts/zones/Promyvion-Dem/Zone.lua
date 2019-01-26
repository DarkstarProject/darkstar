-----------------------------------
--
-- Zone: Promyvion-Dem (18)
--
-----------------------------------
local ID = require("scripts/zones/Promyvion-Dem/IDs")
require("scripts/globals/promyvion")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onInitialize(zone)
    dsp.promyvion.initZone(zone)
end

function onZoneIn(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(185.891, 0, -52.331, 128)
    end

    if player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") == 2 then
        player:completeMission(COP, BELOW_THE_ARKS)
        player:addMission(COP, THE_MOTHERCRYSTALS)
        player:setVar("PromathiaStatus", 0)
    elseif player:getCurrentMission(COP) == THE_MOTHERCRYSTALS then
        if player:hasKeyItem(dsp.ki.LIGHT_OF_HOLLA) and player:hasKeyItem(dsp.ki.LIGHT_OF_MEA) then
            if player:getVar("cslastpromy") == 1 then
                player:setVar("cslastpromy", 0)
                cs = 52
            end
        elseif player:hasKeyItem(dsp.ki.LIGHT_OF_HOLLA) or player:hasKeyItem(dsp.ki.LIGHT_OF_MEA) then
            if player:getVar("cs2ndpromy") == 1 then
                player:setVar("cs2ndpromy", 0)
                cs = 51
            end
        end
    end

    if player:getVar("FirstPromyvionDem") == 1 then
        cs = 50
    end

    return cs
end

function afterZoneIn(player)
    if ENABLE_COP_ZONE_CAP == 1 then
        player:addStatusEffect(dsp.effect.LEVEL_RESTRICTION, 30, 0, 0)
    end
end

function onRegionEnter(player, region)
    dsp.promyvion.onRegionEnter(player, region)
end

function onRegionLeave(player, region)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 46 and option == 1 then
        player:setPos(-226.193, -46.459, -280.046, 127, 14) -- To Hall of Transference {R}
    elseif csid == 50 then
        player:setVar("FirstPromyvionDem", 0)
    end
end