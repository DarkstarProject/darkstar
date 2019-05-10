-----------------------------------
--
-- Zone: Port_Bastok (236)
--
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs");
require("scripts/globals/conquest")
require("scripts/globals/missions")
require("scripts/globals/settings")
require("scripts/globals/zone")
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1,-112,-3,-17,-96,3,-3);--event COP
    zone:registerRegion(2, 53.5, 5, -165.3, 66.5, 6, -72)--drawbridge area
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    -- FIRST LOGIN (START CS)
    if (player:getPlaytime(false) == 0) then
        if (OPENING_CUTSCENE_ENABLE == 1) then
            cs = 1;
        end
        player:setPos(132,-8.5,-13,179);
        player:setHomePoint();
    end

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        if (prevZone == dsp.zone.BASTOK_JEUNO_AIRSHIP) then
            cs = 73;
            player:setPos(-36.000, 7.000, -58.000, 194);
        else
            local position = math.random(1,5) + 57;
            player:setPos(position,8.5,-239,192);
            if (player:getMainJob() ~= player:getVar("PlayerMainJob")) then
                cs = 30004;
            end
            player:setVar("PlayerMainJob",0);
        end
    end

    if (player:getCurrentMission(COP) == dsp.mission.id.cop.THE_ENDURING_TUMULT_OF_WAR and player:getVar("PromathiaStatus") == 0) then
        cs = 306;
    end

    return cs;
end;

function onRegionEnter(player,region)
    local regionID =region:GetRegionID();
    -- printf("regionID: %u",regionID);
    if (regionID == 1 and player:getCurrentMission(COP) == dsp.mission.id.cop.THE_CALL_OF_THE_WYRMKING and player:getVar("PromathiaStatus") == 0) then
        player:startEvent(305);
    end
end;

function onRegionLeave(player,region)
end;

function onTransportEvent(player,transport)
    player:startEvent(71);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 1) then
        player:messageSpecial(ID.text.ITEM_OBTAINED,536);
    elseif (csid == 71) then
        player:setPos(0,0,0,0,224);
    elseif (csid == 30004 and option == 0) then
        player:setHomePoint();
        player:messageSpecial(ID.text.HOMEPOINT_SET);
    elseif (csid == 305) then
        player:setVar("PromathiaStatus",1);
    elseif (csid == 306) then
        player:setVar("COP_optional_CS_chasalvigne",0);
        player:setVar("COP_optional_CS_Anoki",0);
        player:setVar("COP_optional_CS_Despachaire",0);
        player:setVar("PromathiaStatus",1);
    end
end;