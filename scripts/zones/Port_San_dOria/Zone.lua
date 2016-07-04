-----------------------------------
--
-- Zone: Port_San_dOria (232)
--
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/zone");
require("scripts/globals/settings");
require("scripts/zones/Port_San_dOria/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    -- FIRST LOGIN (START CS)
    if (player:getPlaytime(false) == 0) then
        if (OPENING_CUTSCENE_ENABLE == 1) then
            cs = 0x01F4;
        end
        player:setPos(-104, -8, -128, 227);
        player:setHomePoint();
    end

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        if (prevZone == 223) then
            cs = 0x02BE;
            player:setPos(-1.000, 0.000, 44.000, 0);
        else
            player:setPos(80,-16,-135,165);
            if (player:getMainJob() ~= player:getVar("PlayerMainJob")) then
                cs = 0x7534;
            end
            player:setVar("PlayerMainJob",0);
        end
    end

    if (player:getCurrentMission(COP) == THREE_PATHS and player:getVar("COP_Ulmia_s_Path") == 1) then
             cs =0x0004;
    end

    return cs;
end;

-----------------------------------
-- onConquestUpdate
-----------------------------------

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

-----------------------------------
-- onTransportEvent
-----------------------------------

function onTransportEvent(player,transport)
    player:startEvent(0x02BC);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x01F4) then
        player:messageSpecial(ITEM_OBTAINED,536);
    elseif (csid == 0x02BC) then
        player:setPos(0,0,0,0,223);
    elseif (csid == 0x7534 and option == 0) then
        player:setHomePoint();
        player:messageSpecial(HOMEPOINT_SET);
    elseif (csid == 0x0004) then
        player:setVar("COP_Ulmia_s_Path",2);
    end
end;