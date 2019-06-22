-----------------------------------
--
-- Zone: Sealions_Den (32)
--
-----------------------------------
local ID = require("scripts/zones/Sealions_Den/IDs")
require("scripts/globals/conquest")
require("scripts/globals/missions")
-----------------------------------

function onInitialize(zone)
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(600.101,130.355,797.612,50);
    end
    if (player:getCurrentMission(COP) == dsp.mission.id.cop.ONE_TO_BE_FEARED and player:getVar("PromathiaStatus")==1) then
        cs=15;
    elseif (player:getCurrentMission(COP) == dsp.mission.id.cop.CHAINS_AND_BONDS and player:getVar("PromathiaStatus")==2) then
        cs=14;
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 15) then
        player:setVar("PromathiaStatus",2);
    elseif (csid == 14) then
        player:setVar("PromathiaStatus",3);
    end
end;
