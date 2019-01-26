-----------------------------------
--
-- Zone: Chateau_dOraguille (233)
--
-----------------------------------
local ID = require("scripts/zones/Chateau_dOraguille/IDs")
require("scripts/globals/conquest")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/zone")
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)

    local currentMission = player:getCurrentMission(SANDORIA);
    local MissionStatus = player:getVar("MissionStatus");
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(14.872,8.918,24.002,255);
    end

    if (prevZone == dsp.zone.NORTHERN_SAN_DORIA and currentMission == THE_CRYSTAL_SPRING and player:getVar("MissionStatus") == 2) then
        cs = 555;
    elseif (currentMission == THE_HEIR_TO_THE_LIGHT and MissionStatus == 1) then
        cs = 10;
    elseif (prevZone == dsp.zone.NORTHERN_SAN_DORIA and player:hasKeyItem(dsp.ki.MESSAGE_TO_JEUNO_SANDORIA)) then
        cs = 509;
    elseif (player:getVar("SecretWeaponStatus") == 1) then
        cs = 0;
    elseif (currentMission == COMING_OF_AGE and MissionStatus == 0) then
        cs = 116;
    end

    return cs;

end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 555) then
        player:setVar("MissionStatus",3);
    elseif (csid == 509) then
        player:setVar("MissionStatus",9);
        player:delKeyItem(dsp.ki.MESSAGE_TO_JEUNO_SANDORIA);
    elseif (csid == 0) then
        player:setVar("SecretWeaponStatus",2)
    elseif (csid == 10) then
        player:setVar("MissionStatus",2)
    elseif (csid == 116) then
        player:setVar("MissionStatus",1)
    end

end;
