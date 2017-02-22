-----------------------------------
--
-- Zone: Nashmau (53)
--
-----------------------------------
package.loaded["scripts/zones/Nashmau/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Nashmau/TextIDs");
require("scripts/globals/missions");
require("scripts/globals/settings");

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

    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        if (prevZone == 54 and player:getCurrentMission(TOAU) == THE_BLACK_COFFIN and player:getVar("AhtUrganStatus") == 3) then
            cs = 281;
            player:setPos(-13,2,-62,194);
        elseif (prevZone == 58) then
            cs = 0x00C9;
            player:setPos(11,2,-102,128);
        else
            player:setPos(40.658,-7.527,-24.001,128);
        end
    end

    return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------
function onRegionEnter(player,region)
end;


-----------------------------------
-- onRegionLeave
-----------------------------------

function onRegionLeave(player,region)
end;


-----------------------------------
-- onTransportEvent
-----------------------------------
function onTransportEvent(player,transport)
    if (transport == 59) then
        player:startEvent(200);
    end
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
    if (csid == 200) then
        player:setPos(0,-2,0,0,59);
    elseif (csid == 281) then
        player:completeMission(TOAU,THE_BLACK_COFFIN);
        player:setVar("AhtUrganStatus", 0)
        player:addMission(TOAU,GHOSTS_OF_THE_PAST_TOAU);
    end
end;
