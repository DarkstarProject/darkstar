-----------------------------------
-- 
-- Zone: Ghoyus_Reverie
-- 
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Ghoyus_Reverie/TextIDs"] = nil;
require("scripts/zones/Ghoyus_Reverie/TextIDs");

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
	if (prevZone == 95 or prevZone == 97 or prevZone == 98) then
		GetMobByID(17166720):setHP(0);
		GetMobByID(17174888):setHP(0);
		GetMobByID(17178901):setHP(0);
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



