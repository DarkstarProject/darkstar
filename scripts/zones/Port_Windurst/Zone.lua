-----------------------------------
--
-- Zone: Port_Windurst (240)
--
-----------------------------------

package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
require("scripts/globals/zone");
require("scripts/globals/settings");
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    SetExplorerMoogles(17760450);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    -- FIRST LOGIN (START CS)
    if (player:getPlaytime(false) == 0) then
        if (OPENING_CUTSCENE_ENABLE == 1) then
            cs = 0x0131;
        end
        player:setPos(-120,-5.5,175,48);
        player:setHomePoint();
    end
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        if (prevZone == 225) then
            cs = 0x2714;
            player:setPos(228.000, -3.000, 76.000, 160);
        else
            position = math.random(1,5) + 195;
            player:setPos(position,-15.56,258,65);
            if (player:getMainJob() ~= player:getVar("PlayerMainJob")) then
                cs = 0x7534;
            end
            player:setVar("PlayerMainJob",0);
        end
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
    player:startEvent(0x2712);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- print("RESULT: ",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0131) then
        player:messageSpecial(ITEM_OBTAINED,536);
    elseif (csid == 0x2712) then
        player:setPos(0,0,0,0,225);
    elseif (csid == 0x7534 and option == 0) then
        player:setHomePoint();
        player:messageSpecial(HOMEPOINT_SET);
    end
end;
