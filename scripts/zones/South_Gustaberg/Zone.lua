-----------------------------------
--
-- Zone: South_Gustaberg (107)
--
-----------------------------------
local ID = require("scripts/zones/South_Gustaberg/IDs")
require("scripts/globals/icanheararainbow")
require("scripts/globals/chocobo_digging")
require("scripts/globals/conquest")
require("scripts/globals/missions")
-----------------------------------

function onChocoboDig(player, precheck)
    return dsp.chocoboDig.start(player, precheck)
end

function onInitialize(zone)
end

function onZoneIn(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-601.433, 35.204, -520.031, 1)
    end

    if player:getCurrentMission(COP) == THE_CALL_OF_THE_WYRMKING and player:getVar("VowsDone") == 1 then
        cs = 906
    elseif triggerLightCutscene(player) then -- Quest: I Can Hear A Rainbow
        cs = 901
    elseif player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") == 1 then
        cs = 37
    end

    return cs
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
    if csid == 901 then
        lightCutsceneUpdate(player) -- Quest: I Can Hear A Rainbow
    elseif csid == 37 then
        if player:getXPos() > -390 then
            if player:getZPos() > -301 then
                player:updateEvent(0, 0, 0, 0, 0, 6)
            else
                player:updateEvent(0, 0, 0, 0, 0, 7)
            end
        end
    end
end

function onEventFinish(player, csid, option)
    if csid == 906 then
        if player:getCurrentMission(COP) == A_TRANSIENT_DREAM then
            player:completeMission(COP, A_TRANSIENT_DREAM)
            player:addMission(COP, THE_CALL_OF_THE_WYRMKING)
        end
        player:setVar("VowsDone", 0)
    elseif csid == 901 then
        lightCutsceneFinish(player) -- Quest: I Can Hear A Rainbow
    end
end