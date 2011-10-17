-----------------------------------
-- 
-- Zone: Residential_Area
-- 
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Residential_Area/TextIDs"] = nil;
require("scripts/zones/Residential_Area/TextIDs");

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

	player:setVar("PlayerMainJob",player:getMainJob());
	player:eraseStatusEffect(true);
	player:addHP(player:getMaxHP());
	player:addMP(player:getMaxMP());
	player:setPos(0,0,0,192);

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



