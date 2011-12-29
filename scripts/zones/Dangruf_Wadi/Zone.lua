-----------------------------------
--
-- Zone: Dangruf_Wadi
--
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/settings");
package.loaded["scripts/zones/Dangruf_Wadi/TextIDs"] = nil;
require("scripts/zones/Dangruf_Wadi/TextIDs");

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

	if (player:hasKeyItem(BLUE_ACIDITY_TESTER)) then
		player:delKeyItem(BLUE_ACIDITY_TESTER);
		player:addKeyItem(RED_ACIDITY_TESTER);
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



