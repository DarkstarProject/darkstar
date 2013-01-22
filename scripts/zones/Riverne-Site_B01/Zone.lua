-----------------------------------
-- 
-- Zone: Riverne-Site_B01
-- 
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");
package.loaded["scripts/zones/Riverne-Site_B01/TextIDs"] = nil;
require("scripts/zones/Riverne-Site_B01/TextIDs");

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
 
	-- ZONE LEVEL RESTRICTION
 if(ENABLE_COP_ZONE_CAP == 1)then
	player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,50,0,0);
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



