-----------------------------------
-- 
-- Zone: Stellar_Fulcrum
-- 
-----------------------------------
package.loaded["scripts/zones/Stellar_Fulcrum/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Stellar_Fulcrum/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
	
	zone:registerRegion(1, -522, -2, -49,  -517, -1, -43); -- To Upper Delkfutt's Tower
	
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

function onRegionEnter(player,region)
	
	if(region:GetRegionID() == 1) then
		player:startEvent(8);
	end
	
end;

-----------------------------------
-- onRegionLeave
-----------------------------------

function onRegionLeave(player,region)
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
	
	if(csid == 8 and menuchoice == 1) then
		player:setPos(-370, -178, -40, 243, 0x9e);
	end
	
end;