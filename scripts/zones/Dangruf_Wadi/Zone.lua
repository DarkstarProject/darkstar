-----------------------------------
--
-- Zone: Dangruf_Wadi
--
-----------------------------------
package.loaded["scripts/zones/Dangruf_Wadi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/zones/Dangruf_Wadi/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
	zone:registerRegion(1, -133.800, 1, 133.450, -132.800, 4, 134.800);
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
switch (region:GetRegionID()): caseof
{
	---------------------------------
	[1] = function (x)
	---------------------------------
		player:startEvent(0x000A);
		SendUncnown0x39Packet(17559896);
	end,
	---------------------------------
}
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



