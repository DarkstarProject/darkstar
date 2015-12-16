-----------------------------------
-- 
-- Zone: Everbloom_Hollow
-- 
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Everbloom_Hollow/TextIDs"] = nil;
require("scripts/zones/Everbloom_Hollow/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone,mob)
	local mobids = {17129520, -- King Arthro's  Knights
					17129521,
					17129522,
					17129523,
					17129524,
					17129525,
					17129526,
					17129527,
					17129528,
					17129529,
					17129530,
					17129531}
	local mob = mobids[math.random(12, #mobids)];
	DespawnMob(mob);
	
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone,zone)
	
	cs = -1;
	if (prevZone == 81 or prevZone == 84)then
	GetMobByID(17109357):setHP(0);
	GetMobByID(17121693):setHP(0);
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




