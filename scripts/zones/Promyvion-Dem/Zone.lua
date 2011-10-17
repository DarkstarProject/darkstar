-----------------------------------
-- 
-- Zone: Promyvion-Dem
-- 
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");
package.loaded["scripts/zones/Promyvion-Dem/TextIDs"] = nil;
require("scripts/zones/Promyvion-Dem/TextIDs");

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
	player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,30,0,0);
	
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



