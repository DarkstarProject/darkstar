-----------------------------------
--
-- Zone: Port_San_dOria (232)
--
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
require("scripts/globals/conquest")
require("scripts/globals/missions")
require("scripts/globals/settings")
require("scripts/globals/zone")
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    -- FIRST LOGIN (START CS)
    if (player:getPlaytime(false) == 0) then
        if (OPENING_CUTSCENE_ENABLE == 1) then
            cs = 500;
        end
        player:setPos(-104, -8, -128, 227);
        player:setHomePoint();
    end

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        if (prevZone == dsp.zone.SAN_DORIA_JEUNO_AIRSHIP) then
            cs = 702;
            player:setPos(-1.000, 0.000, 44.000, 0);
        else
            player:setPos(80,-16,-135,165);
            if (player:getMainJob() ~= player:getCharVar("PlayerMainJob")) then
                cs = 30004;
            end
            player:setCharVar("PlayerMainJob",0);
        end
    end

    if (player:getCurrentMission(COP) == dsp.mission.id.cop.THREE_PATHS and player:getCharVar("COP_Ulmia_s_Path") == 1) then
        cs =4;
    end

    return cs;
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onTransportEvent(player,transport)
    player:startEvent(700);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 500) then
        player:messageSpecial(ID.text.ITEM_OBTAINED,536);
    elseif (csid == 700) then
        player:setPos(0,0,0,0,223);
    elseif (csid == 30004 and option == 0) then
        player:setHomePoint();
        player:messageSpecial(ID.text.HOMEPOINT_SET);
    elseif (csid == 4) then
        player:setCharVar("COP_Ulmia_s_Path",2);
    end
end;