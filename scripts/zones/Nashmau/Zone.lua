-----------------------------------
--
-- Zone: Nashmau (53)
--
-----------------------------------
package.loaded["scripts/zones/Nashmau/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Nashmau/TextIDs");

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
   if (prevZone == 58) then 
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
     player:startEvent(0x00c8);
   end
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
   if (csid == 0x00c8) then
     player:setPos(0,-2,0,0,59);
   end
end;
