-----------------------------------
--
-- Zone: West_Sarutabaruta (115)
--
-----------------------------------
local ID = require("scripts/zones/West_Sarutabaruta/IDs")
require("scripts/globals/icanheararainbow")
require("scripts/globals/chocobo_digging")
require("scripts/globals/conquest")
require("scripts/globals/missions")
require("scripts/globals/helm")
require("scripts/globals/zone")
-----------------------------------

function onChocoboDig(player, precheck)
    return dsp.chocoboDig.start(player, precheck)
end

function onInitialize(zone)
    dsp.conq.setRegionalConquestOverseers(zone:getRegionID())

    dsp.helm.initZone(zone, dsp.helm.type.HARVESTING)
end

function onZoneIn( player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-374.008, -23.712, 63.289, 213)
    end

    if triggerLightCutscene(player) then -- Quest: I Can Hear A Rainbow
        cs = 48
    elseif player:getCurrentMission(ASA) == BURGEONING_DREAD and prevZone == dsp.zone.WINDURST_WATERS then
        cs = 62
    elseif player:getCurrentMission(ASA) == BURGEONING_DREAD and prevZone == dsp.zone.PORT_WINDURST then
        cs = 63
    elseif player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") == 1 then
        cs = 50
    -- removed only "cs =" works onzonein and can't take parameters atm
    -- elseif player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") == 1 then
        -- player:startEvent(50,0,0,0,0,0,2) -- talking doll go east
    end

    return cs
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onRegionEnter( player, region)
end

function onEventUpdate( player, csid, option)
    if csid == 48 then
        lightCutsceneUpdate(player) -- Quest: I Can Hear A Rainbow
    elseif csid == 62 or csid == 63 then
        player:setVar("ASA_Status", option)
    elseif csid == 50 then
        if player:getZPos() > 470 then
            player:updateEvent(0,0,0,0,0,2)
        else
            player:updateEvent(0,0,0,0,0,1)
        end
    end
end

function onEventFinish( player, csid, option)
    if csid == 48 then
        lightCutsceneFinish(player) -- Quest: I Can Hear A Rainbow
    elseif csid == 62 or csid == 63 then
        player:completeMission(ASA, BURGEONING_DREAD)
        player:addMission(ASA, THAT_WHICH_CURDLES_BLOOD)
    end
end