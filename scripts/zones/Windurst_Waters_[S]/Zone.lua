-----------------------------------
--
-- Zone: Windurst_Waters_[S] (94)
--
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters_[S]/IDs")
require("scripts/globals/chocobo")
-----------------------------------

function onInitialize(zone)
    dsp.chocobo.initZone(zone)
end

function onZoneIn(player,prevZone)
    local cs = -1

    -- MOG HOUSE EXIT
    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(157 + math.random(1,5), -5, -62, 192)
        if player:getMainJob() ~= player:getVar("PlayerMainJob") then
            cs = 30004
        end
        player:setVar("PlayerMainJob", 0)
    end

    return cs
end

function onRegionEnter(player,region)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end