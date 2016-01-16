-----------------------------------
-- 
-- Zone: Open_sea_route_to_Al_Zahbi (46)
-- 
-----------------------------------
package.loaded["scripts/zones/Open_sea_route_to_Al_Zahbi/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Open_sea_route_to_Al_Zahbi/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
local cs = -1;    
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        local position = math.random(-2,2) + 0.150;    
        player:setPos(position,-2.100,3.250,64);
    end    
return cs;    
end;

-----------------------------------
-- onTransportEvent
-----------------------------------

function onTransportEvent(player,transport)
    player:startEvent(0x0404);
    player:messageSpecial(DOCKING_IN_AL_ZAHBI);
end;

-----------------------------------
-- onRegionEnter          
-----------------------------------

function onRegionEnter(player,region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
printf("CSID: %u",csid);
printf("RESULT: %u",option);
    if (csid == 0x0404) then
        player:setPos(0,0,0,0,50);
    end
end;