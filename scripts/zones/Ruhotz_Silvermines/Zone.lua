-----------------------------------
-- 
-- Zone: Ruhotz_Silvermines
-- 
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Ruhotz_Silvermines/TextIDs"] = nil;
require("scripts/zones/Ruhotz_Silvermines/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
	
	cs = -1;

	if (prevZone == 88) then
	GetMobByID(17138041):setHP(0);
	end
	if (prevZone == 91) then
	GetMobByID(17150317):setHP(0);
	
	end
	return cs;
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;


