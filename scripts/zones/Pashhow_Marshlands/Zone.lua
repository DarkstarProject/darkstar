-----------------------------------
--
-- Zone: Pashhow_Marshlands
--
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Pashhow_Marshlands/TextIDs"] = nil;
require("scripts/zones/Pashhow_Marshlands/TextIDs");

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

	if (player:getCurrentMission(1) == 10) then
		missionStatus = player:getVar("MissionStatus");
		if (missionStatus < 22) then
			cs = 0x000a;
		elseif (missionStatus == 22) then
			cs = 0x000b;
		end
	end

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

	if (csid == 0x000a) then
		player:setPos(578, 25, -376, 126);
	elseif (csid == 0x000b) then
		player:completeMission(1);
		player:addRankPoints(10);
		player:setVar("MissionStatus",0);
		player:setPos(578, 25, -376, 126);
	end
end;



