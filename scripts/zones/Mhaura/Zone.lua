-----------------------------------
--
-- Zone: Mhaura (249)
--
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/zone");
require("scripts/zones/Mhaura/TextIDs");
require("scripts/globals/missions");
-----------------------------------

function onInitialize(zone)

    SetExplorerMoogles(17797253);

end;

function onZoneIn(player,prevZone)
    local cs = -1;
    local currentday = tonumber(os.date("%j"));
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        if (prevZone == 221 or prevZone == 47) then
            cs = 0x00ca;
            player:setPos(14.960,-3.430,18.423,192);
        else
            player:setPos(0.003,-6.252,117.971,65);
        end
    end
    if (player:getCurrentMission(COP) == DAWN and player:getVar("PromathiaStatus")==3 and player:getVar("Promathia_kill_day") ~= currentday and player:getVar("COP_shikarees_story")== 0 ) then
        cs=322;
    end
return cs;
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onTransportEvent(player,transport)
    if ((transport == 47) or (transport == 46)) then
        if (not(player:hasKeyItem(BOARDING_PERMIT)) or ENABLE_TOAU == 0) then
            player:setPos(8.200,-1.363,3.445,192);
            player:messageSpecial(DO_NOT_POSSESS, BOARDING_PERMIT);
        else
            player:startEvent(200);
        end
    else
        player:startEvent(200);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 200) then
        local DepartureTime = VanadielHour();
        if (DepartureTime % 8 == 0) then
            player:setPos(0,0,0,0,220); -- Boat to Selbina
        elseif (DepartureTime % 8 == 4) then
            player:setPos(0,0,0,0,46); -- Boat to Aht Urhgan
        else
            player:setPos(8,-1,5,62,249); -- Something went wrong, dump them on the dock for safety.
        end
    elseif (csid == 322) then
        player:setVar("COP_shikarees_story",1);
    end
end;