-----------------------------------
-- 
-- Zone: Sacrarium
-- 
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");
package.loaded["scripts/zones/Sacrarium/TextIDs"] = nil;
require("scripts/zones/Sacrarium/TextIDs");

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
	player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,50,0,0);
	
return cs;
end;

-----------------------------------
-- onRegionEnter          
-----------------------------------

function onRegionEnter(player,regionID)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,menuchoice)
--print("CSID: ",csid);
--print("RESULT: ",menuchoice);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,menuchoice)
--print("CSID: ",csid);
--print("RESULT: ",menuchoice);
end;



