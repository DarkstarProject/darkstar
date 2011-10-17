-----------------------------------
-- 
-- Zone: Heavens_Tower
-- 
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Heavens_Tower/TextIDs"] = nil;
require("scripts/zones/Heavens_Tower/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
	zone:registerRegion(1, -1,-1,-35, 1,1,-33);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
cs = -1;

return cs;
end;

-----------------------------------
-- onRegionEnter          
-----------------------------------

function onRegionEnter(player,regionID)
switch (regionID): caseof 
{
	---------------------------------
	[1] = function (x)  -- Heaven's Tower exit portal
	---------------------------------
		player:startEvent(0x29);
	end,
	---------------------------------
}
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	if (csid == 0x29) then
		player:setPos(0,-17,135,60,239);
	end
end;



